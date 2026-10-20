/* Service worker de French For Beginners.
 * Rôle : rendre le site installable, accélérer les fichiers statiques
 * et afficher une page claire quand la connexion est perdue.
 * Les pages HTML ne sont JAMAIS mises en cache (comptes, scores, données à jour).
 * Les médias (/uploads : audio, images) ne sont pas mis en cache non plus.
 * Pour forcer une mise à jour du cache : changer VERSION. */
const VERSION = 'v1';
const CACHE = 'ffb-static-' + VERSION;
const OFFLINE_URL = '/offline.html';
const PRECACHE = [OFFLINE_URL, '/pwa/icon-192.png', '/pwa/icon-512.png'];
const STATIC_PREFIXES = ['/css/', '/js/', '/pwa/'];
const CDN_HOSTS = ['cdn.jsdelivr.net'];

self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE).then((c) => c.addAll(PRECACHE)).then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys()
      .then((keys) => Promise.all(
        keys.filter((k) => k.startsWith('ffb-') && k !== CACHE).map((k) => caches.delete(k))
      ))
      .then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', (event) => {
  const req = event.request;
  if (req.method !== 'GET') return;

  const url = new URL(req.url);

  // Pages : réseau d'abord, page « hors ligne » si le réseau échoue.
  if (req.mode === 'navigate') {
    event.respondWith(fetch(req).catch(() => caches.match(OFFLINE_URL)));
    return;
  }

  const sameOrigin = url.origin === self.location.origin;
  const isStatic = sameOrigin && STATIC_PREFIXES.some((p) => url.pathname.startsWith(p));
  const isCdn = CDN_HOSTS.includes(url.hostname);

  if (isStatic || isCdn) {
    event.respondWith(staleWhileRevalidate(req));
  }
  // Tout le reste (API, /uploads, /admin, quiz...) : comportement normal du navigateur.
});

function staleWhileRevalidate(req) {
  return caches.open(CACHE).then((cache) =>
    cache.match(req).then((cached) => {
      const network = fetch(req).then((res) => {
        if (res && (res.ok || res.type === 'opaque')) cache.put(req, res.clone());
        return res;
      }).catch(() => cached);
      return cached || network;
    })
  );
}
