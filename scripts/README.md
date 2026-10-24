# Sauvegarde et restauration

## Sur le serveur
```bash
cd ~/French-for-beginners          # le dossier du projet
./scripts/backup.sh                # crée backups/frenchdb-AAAAMMJJ-HHMM.sql.gz et uploads-….tar.gz
```
Les 14 dernières sauvegardes sont conservées. Le dossier `backups/` n'est pas versionné (ignoré par git).

### Automatique, chaque nuit à 3 h
```bash
crontab -e
# puis ajouter la ligne (adaptez le chemin) :
0 3 * * * cd /home/opc/French-for-beginners && ./scripts/backup.sh >> backups/backup.log 2>&1
```

## Copie sur votre PC (hors serveur)
Une sauvegarde qui reste sur le serveur ne protège pas d'une panne du serveur. Depuis votre PC (PowerShell) :
```powershell
scp opc@frenchforbeginners.duckdns.org:French-for-beginners/backups/derniere-base.sql.gz .
```
Gardez au moins une copie ailleurs que sur ce PC (disque externe ou stockage de l'association).
Ces fichiers contiennent les comptes des apprenants : ne les mettez jamais dans le dépôt GitHub.

## Tester la restauration (sur votre PC, pas sur le serveur)
1. Lancez l'application en local (`docker compose up -d`).
2. `./scripts/restore.sh derniere-base.sql.gz` (Git Bash ou WSL), répondez `OUI`.
3. `docker compose restart app`, puis vérifiez que vous pouvez vous connecter et que les résultats sont là.

Une sauvegarde non testée n'est pas une sauvegarde : refaites ce test de temps en temps.
