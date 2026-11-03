# Déploiement automatique (CD) - French For Beginners

Quand vous publiez une **version** (une étiquette Git comme `v1.15.5`), GitHub fait tout seul :

```
étiquette v1.15.5  →  tests  →  image Docker (PC/serveur classique + ARM)  →  Docker Hub
                                                                              |
                  site mis à jour  ←  sauvegarde + redémarrage + contrôle  ←  serveur (SSH)
```

Si la nouvelle version ne répond pas au bout de 3 minutes, le serveur **revient tout seul à la version précédente**.

---

## 1. À faire une seule fois

### a) Un « jeton » Docker Hub
Docker Hub → votre profil → *Account settings* → *Personal access tokens* → *Generate new token*, droits **Read & Write**. Copiez-le (il ne s'affiche qu'une fois).

### b) Une clé SSH réservée au déploiement
Sur votre PC (Git Bash) :
```bash
ssh-keygen -t ed25519 -f deploy_key -N "" -C "github-deploy"
```
Deux fichiers sont créés : `deploy_key` (privé, secret) et `deploy_key.pub` (public).

Sur le serveur, ajoutez la clé **publique** :
```bash
echo "COLLEZ ICI le contenu de deploy_key.pub" >> ~/.ssh/authorized_keys
```
Puis supprimez les deux fichiers de votre PC après l'étape suivante (la clé privée ne doit pas traîner).

### c) L'empreinte du serveur
Depuis votre PC :
```bash
ssh-keyscan -t ed25519 IP_DU_SERVEUR
```
Gardez la ligne affichée (elle commence par l'IP) : elle permet à GitHub de reconnaître **votre** serveur et pas un imposteur.

### d) Les secrets GitHub
GitHub → dépôt → *Settings* → *Secrets and variables* → *Actions* → *New repository secret* :

| Nom | Valeur |
|---|---|
| `DOCKERHUB_USERNAME` | `rolandmerhej1` |
| `DOCKERHUB_TOKEN` | le jeton de l'étape a |
| `SSH_HOST` | l'adresse IP du serveur |
| `SSH_USER` | `opc` (Oracle Linux) ou `ubuntu` (Ubuntu) |
| `SSH_KEY` | tout le contenu du fichier `deploy_key` (privé), y compris les lignes `-----BEGIN…` et `-----END…` |
| `SSH_KNOWN_HOSTS` | la ligne de l'étape c |

Si le dossier du projet sur le serveur n'est pas `~/French-for-beginners`, ajoutez aussi une **variable** (même page, onglet *Variables*) `DEPLOY_DIR` avec le nom du dossier.

### e) Un « environnement » de production (conseillé)
*Settings* → *Environments* → *New environment* → `production`. Cochez *Required reviewers* et mettez-vous : GitHub vous demandera un clic « Approuver » avant chaque mise en ligne. Vous gardez la main.

### f) Sur le serveur
```bash
cd ~/French-for-beginners
git pull
```
Le fichier `.env` n'est pas touché. Il peut maintenant contenir `APP_TAG` (écrit par le script) et, sur un gros serveur, `JAVA_OPTS` et `MYSQL_BUFFER_POOL` (voir `.env.exemple`).

Si votre dépôt Docker Hub est **privé**, faites une fois `docker login` sur le serveur.

---

## 2. Publier une nouvelle version

1. Votre changement est fusionné dans `main` et le CI est vert.
2. Depuis votre PC :
   ```bash
   git checkout main
   git pull
   git tag v1.15.5
   git push origin v1.15.5
   ```
3. GitHub → onglet **Actions** → « CD » : vous suivez les 3 étapes. Cliquez sur **Approuver** si vous avez activé l'étape e.
4. Vérifiez le site.

Le numéro doit avoir la forme `v1.2.3` (trois nombres).

## 3. Revenir à une ancienne version
GitHub → **Actions** → « CD » → **Run workflow** → tapez la version (ex. `v1.15.4`) → *Run workflow*. L'image existe déjà sur Docker Hub : seule l'étape serveur est refaite.

## 4. Et si ça échoue ?
Ouvrez l'exécution rouge dans *Actions* et lisez la dernière étape. Cas courants :

* **Les tests échouent** : rien n'est publié, rien n'est touché.
* **`Permission denied (publickey)`** : la clé publique n'est pas dans `authorized_keys`, ou `SSH_USER` est faux.
* **`Host key verification failed`** : `SSH_KNOWN_HOSTS` ne correspond pas à l'IP de `SSH_HOST`.
* **« la version … ne répond pas »** : le serveur est revenu seul à l'ancienne version. Regardez le journal affiché dans cette même étape.

Le script peut aussi se lancer à la main sur le serveur : `bash scripts/deploy.sh v1.15.5`.

---

## 5. À savoir

* **Le SQL n'est pas lancé automatiquement.** Si une version demande une modification de la base, passez-la **avant** de publier l'étiquette, avec une modification compatible avec l'ancienne version (on ajoute, on ne supprime pas). Sinon le retour arrière ne marchera pas.
* **Une sauvegarde est faite avant chaque mise à jour** (`backups/`, voir `scripts/README.md`).
* Le port SSH (22) doit rester ouvert à Internet, car les machines de GitHub n'ont pas d'adresse fixe. Gardez la connexion **par clé uniquement** (pas de mot de passe SSH).
* Pour limiter encore les risques, dans `authorized_keys` vous pouvez restreindre la clé de déploiement à cette seule commande :
  ```
  command="cd $HOME/French-for-beginners && bash scripts/deploy.sh \"${SSH_ORIGINAL_COMMAND##* }\"",no-pty,no-port-forwarding,no-agent-forwarding ssh-ed25519 AAAA… github-deploy
  ```
  (à n'activer qu'après un premier déploiement réussi).
* **Après un déménagement** vers un autre serveur : changez seulement les secrets `SSH_HOST`, `SSH_USER` et `SSH_KNOWN_HOSTS`, et ajoutez la clé publique sur le nouveau serveur.
