// PWA : enregistre le service worker et propose un bouton « Installer l'application ».
(function () {
  // 1) Service worker (sans effet si le navigateur ne le gère pas)
  if ('serviceWorker' in navigator) {
    window.addEventListener('load', function () {
      navigator.serviceWorker
        .register('/sw.js', { scope: '/', updateViaCache: 'none' })
        .catch(function () { /* silencieux : le site fonctionne sans */ });
    });
  }

  // 2) Bouton d'installation
  var KEY = 'pwaInstallDismissed';
  var deferredPrompt = null;

  function isStandalone() {
    return window.matchMedia('(display-mode: standalone)').matches || window.navigator.standalone === true;
  }
  function dismissed() {
    try { return localStorage.getItem(KEY) === '1'; } catch (e) { return false; }
  }
  function remember() {
    try { localStorage.setItem(KEY, '1'); } catch (e) { /* ignore */ }
  }

  var ua = navigator.userAgent;
  var isIOS = /iPad|iPhone|iPod/.test(ua) || (navigator.platform === 'MacIntel' && navigator.maxTouchPoints > 1);

  function showButton(onClick) {
    if (isStandalone() || dismissed() || document.getElementById('installAppBox')) return;
    var box = document.createElement('div');
    box.id = 'installAppBox';
    box.className = 'position-fixed d-flex align-items-center gap-1 shadow rounded-pill bg-primary text-white';
    // centré en bas : le bouton « Retour » est à gauche, la flèche « haut » à droite
    box.style.cssText = 'left:50%;transform:translateX(-50%);bottom:16px;z-index:1050;padding:4px 6px 4px 14px;white-space:nowrap;';
    var btn = document.createElement('button');
    btn.type = 'button';
    btn.className = 'btn btn-sm text-white border-0 fw-semibold';
    btn.textContent = '📲 Installer l’application';
    btn.addEventListener('click', function () { onClick(box); });
    var close = document.createElement('button');
    close.type = 'button';
    close.className = 'btn-close btn-close-white btn-sm';
    close.setAttribute('aria-label', 'Masquer');
    close.addEventListener('click', function () { remember(); box.remove(); });
    box.appendChild(btn);
    box.appendChild(close);
    document.body.appendChild(box);
  }

  // Chrome / Edge / Android : le navigateur annonce que l'installation est possible
  window.addEventListener('beforeinstallprompt', function (e) {
    e.preventDefault();
    deferredPrompt = e;
    var run = function () {
      showButton(function (box) {
        if (!deferredPrompt) return;
        deferredPrompt.prompt();
        deferredPrompt.userChoice.then(function () {
          deferredPrompt = null;
          box.remove();
        });
      });
    };
    if (document.body) run(); else document.addEventListener('DOMContentLoaded', run);
  });

  window.addEventListener('appinstalled', function () {
    var b = document.getElementById('installAppBox');
    if (b) b.remove();
  });

  // iPhone / iPad (Safari) : pas d'API d'installation, on explique la marche à suivre
  if (isIOS && !isStandalone()) {
    document.addEventListener('DOMContentLoaded', function () {
      showButton(function () {
        alert('Pour installer : touchez le bouton Partager (carré avec une flèche), puis « Sur l’écran d’accueil ».');
      });
    });
  }
})();
