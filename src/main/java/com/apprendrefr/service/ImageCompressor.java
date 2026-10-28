package com.apprendrefr.service;

import com.apprendrefr.exception.FileUploadException;
import net.coobird.thumbnailator.Thumbnails;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageInputStream;
import javax.imageio.stream.ImageOutputStream;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

/**
 * Allège les images envoyées depuis l'administration : largeur limitée (800 px) et JPEG de qualité 82
 * pour les photos. Une image avec de la transparence reste en PNG (un JPEG la noircirait).
 * Une photo de 1,2 Mo en PNG pèse environ 80 Ko en JPEG, sans différence visible à l'écran.
 */
public class ImageCompressor {

    /** Image compressée et extension à lui donner (« .jpg » ou « .png »). */
    public record Result(byte[] bytes, String extension) {
    }

    static final int DEFAULT_MAX_WIDTH = 800;
    static final float DEFAULT_QUALITY = 0.82f;
    /** Au-delà (16 mégapixels ; un téléphone en fait 12), on refuse : décoder une telle image saturerait la mémoire du serveur. */
    static final long DEFAULT_MAX_PIXELS = 16_000_000L;

    private final int maxWidth;
    private final float quality;
    private final long maxPixels;

    public ImageCompressor() {
        this(DEFAULT_MAX_WIDTH, DEFAULT_QUALITY, DEFAULT_MAX_PIXELS);
    }

    ImageCompressor(int maxWidth, float quality, long maxPixels) {
        this.maxWidth = maxWidth;
        this.quality = quality;
        this.maxPixels = maxPixels;
    }

    public Result compress(byte[] data) {
        try {
            int width = checkedWidth(data);
            // Thumbnailator applique aussi l'orientation EXIF des photos de téléphone, que le JPEG recréé perd
            Thumbnails.Builder<? extends InputStream> builder = Thumbnails.of(new ByteArrayInputStream(data));
            BufferedImage image;
            if (width > maxWidth) {
                image = builder.width(maxWidth).asBufferedImage();
            } else {
                image = builder.scale(1.0).asBufferedImage();
            }

            if (hasTransparency(image)) {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                ImageIO.write(image, "png", out);
                return new Result(out.toByteArray(), ".png");
            }
            return new Result(toJpeg(image), ".jpg");
        } catch (IOException e) {
            throw new FileUploadException("Image illisible ou abîmée", e);
        }
    }

    /** Vérifie que c'est une vraie image de taille raisonnable (lecture de l'en-tête seulement) et renvoie sa largeur. */
    private int checkedWidth(byte[] data) throws IOException {
        try (ImageInputStream in = ImageIO.createImageInputStream(new ByteArrayInputStream(data))) {
            Iterator<ImageReader> readers = in == null ? null : ImageIO.getImageReaders(in);
            if (readers == null || !readers.hasNext()) {
                throw new FileUploadException("Le fichier n'est pas une image valide");
            }
            ImageReader reader = readers.next();
            try {
                reader.setInput(in);
                int width = reader.getWidth(0);
                if ((long) width * reader.getHeight(0) > maxPixels) {
                    throw new FileUploadException("Image trop grande : réduisez-la avant de l'envoyer");
                }
                return width;
            } finally {
                reader.dispose();
            }
        }
    }

    static boolean hasTransparency(BufferedImage image) {
        if (!image.getColorModel().hasAlpha()) {
            return false;
        }
        for (int y = 0; y < image.getHeight(); y++) {
            for (int x = 0; x < image.getWidth(); x++) {
                if ((image.getRGB(x, y) >>> 24) < 255) {
                    return true;
                }
            }
        }
        return false;
    }

    private byte[] toJpeg(BufferedImage image) throws IOException {
        // Le JPEG n'a pas de canal alpha : on dessine l'image sur un fond RGB
        BufferedImage rgb = new BufferedImage(image.getWidth(), image.getHeight(), BufferedImage.TYPE_INT_RGB);
        Graphics2D g = rgb.createGraphics();
        try {
            g.drawImage(image, 0, 0, null);
        } finally {
            g.dispose();
        }

        ImageWriter writer = ImageIO.getImageWritersByFormatName("jpeg").next();
        ImageWriteParam param = writer.getDefaultWriteParam();
        param.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
        param.setCompressionQuality(quality);
        param.setProgressiveMode(ImageWriteParam.MODE_DEFAULT);

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        try (ImageOutputStream ios = ImageIO.createImageOutputStream(out)) {
            writer.setOutput(ios);
            writer.write(null, new IIOImage(rgb, null, null), param);
        } finally {
            writer.dispose();
        }
        return out.toByteArray();
    }
}
