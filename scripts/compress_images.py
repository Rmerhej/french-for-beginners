# -*- coding: utf-8 -*-
"""Convertit les grosses photos PNG de uploads/images en JPEG (qualité 82, 800 px de large au maximum).

Lancé par scripts/compress-images.sh dans un conteneur Python (Pillow). Modes :
  dry     : montre ce qui serait fait, ne change rien
  convert : crée les .jpg à côté des .png (les .png sont conservés) et écrit les fichiers SQL
  clean   : supprime les .png qui ont été convertis (à faire plus tard, une fois le site vérifié)
"""
import io
import os
import sys

from PIL import Image, ImageOps

IMG_DIR = os.environ.get("IMG_DIR", "/data")
OUT_DIR = os.environ.get("OUT_DIR", "/out")
URL_PREFIX = "/uploads/images/"
MIN_SIZE = 150 * 1024      # en dessous, c'est une icône ou un petit dessin : on n'y touche pas
MAX_WIDTH = 800
QUALITY = 82
MIN_GAIN = 0.85            # on garde le JPEG seulement s'il pèse moins de 85 % du PNG
TABLES = ("lessons", "quizzes", "vocabularies")   # tables qui ont une colonne image_url
LIST_FILE = os.path.join(OUT_DIR, "images-converted.txt")


def has_transparency(im):
    if im.mode in ("RGBA", "LA") or (im.mode == "P" and "transparency" in im.info):
        return im.convert("RGBA").getchannel("A").getextrema()[0] < 255
    return False


def sql_text(pairs, title):
    lines = ["-- " + title, "SET NAMES utf8mb4;"]
    for old, new in pairs:
        for table in TABLES:
            lines.append("UPDATE `%s` SET `image_url` = '%s' WHERE `image_url` = '%s';" % (
                table, (URL_PREFIX + new).replace("'", "''"), (URL_PREFIX + old).replace("'", "''")))
    return "\n".join(lines) + "\n"


def clean():
    if not os.path.exists(LIST_FILE):
        print("Rien à nettoyer : aucune conversion enregistrée.")
        return
    removed = 0
    with open(LIST_FILE, encoding="utf8") as f:
        for line in f:
            old, new = line.rstrip("\n").split("\t")
            if os.path.exists(os.path.join(IMG_DIR, new)) and os.path.exists(os.path.join(IMG_DIR, old)):
                os.remove(os.path.join(IMG_DIR, old))
                removed += 1
    print("%d fichiers PNG supprimés (leur version JPEG existe)." % removed)


def convert(dry):
    pairs = []
    old_total = new_total = 0
    for name in sorted(os.listdir(IMG_DIR)):
        if not name.lower().endswith(".png") or name.lower().startswith("favicon"):
            continue
        path = os.path.join(IMG_DIR, name)
        size = os.path.getsize(path)
        if size < MIN_SIZE:
            continue
        new_name = name[:-4] + ".jpg"
        new_path = os.path.join(IMG_DIR, new_name)
        if os.path.exists(new_path):
            print("déjà converti :", name)
            continue
        try:
            im = Image.open(path)
            im.load()
        except Exception as exc:  # fichier abîmé : on le signale et on continue
            print("illisible, laissé :", name, exc)
            continue
        if has_transparency(im):
            print("transparence, laissé :", name)
            continue
        im = ImageOps.exif_transpose(im).convert("RGB")
        if im.width > MAX_WIDTH:
            im = im.resize((MAX_WIDTH, round(im.height * MAX_WIDTH / im.width)), Image.LANCZOS)
        buf = io.BytesIO()
        im.save(buf, "JPEG", quality=QUALITY, optimize=True, progressive=True)
        data = buf.getvalue()
        if len(data) > size * MIN_GAIN:
            print("gain trop faible, laissé :", name)
            continue
        pairs.append((name, new_name))
        old_total += size
        new_total += len(data)
        if not dry:
            with open(new_path, "wb") as out:
                out.write(data)
            os.chmod(new_path, 0o644)
    print()
    print("%d images à convertir : %.1f Mo -> %.1f Mo (%d %% en moins)" % (
        len(pairs), old_total / 1e6, new_total / 1e6, 100 - 100 * new_total / old_total if old_total else 0))
    if dry or not pairs:
        return
    os.makedirs(OUT_DIR, exist_ok=True)
    with open(os.path.join(OUT_DIR, "images-to-jpg.sql"), "w", encoding="utf8") as f:
        f.write(sql_text(pairs, "Chemins des images : .png -> .jpg (tables lessons, quizzes, vocabularies)"))
    with open(os.path.join(OUT_DIR, "images-to-jpg-rollback.sql"), "w", encoding="utf8") as f:
        f.write(sql_text([(n, o) for o, n in pairs], "Retour en arrière : .jpg -> .png"))
    with open(LIST_FILE, "w", encoding="utf8") as f:
        f.write("".join("%s\t%s\n" % p for p in pairs))


if __name__ == "__main__":
    mode = sys.argv[1] if len(sys.argv) > 1 else "dry"
    if mode == "clean":
        clean()
    else:
        convert(mode == "dry")
