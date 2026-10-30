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

  // Comptage anonyme (type + plateforme + date, sans identifiant) : voir /visitor/pwa-event
  function platform() {
    if (isIOS) return 'ios';
    if (/Android/i.test(ua)) return 'android';
    return 'desktop';
  }
  function sendEvent(type) {
    try {
      var url = '/visitor/pwa-event?type=' + type + '&p=' + platform();
      if (navigator.sendBeacon) {
        navigator.sendBeacon(url);
      } else {
        fetch(url, { method: 'POST', keepalive: true });
      }
    } catch (e) { /* ignore */ }
  }

  // Ouverture depuis l'icône (mode « application ») : une fois par session
  if (isStandalone()) {
    try {
      if (!sessionStorage.getItem('pwaLaunchSent')) {
        sessionStorage.setItem('pwaLaunchSent', '1');
        sendEvent('launched');
      }
    } catch (e) {
      sendEvent('launched');
    }

    // iPhone / iPad : Safari n'annonce pas l'installation. La première ouverture depuis
    // l'icône sert d'approximation (le stockage est vidé quand l'app est supprimée).
    if (isIOS) {
      try {
        if (!localStorage.getItem('pwaFirstLaunchSent')) {
          localStorage.setItem('pwaFirstLaunchSent', '1');
          sendEvent('installed');
        }
      } catch (e) { /* ignore */ }
    }
  }

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
    sendEvent('installed');
    var b = document.getElementById('installAppBox');
    if (b) b.remove();
  });

  // iPhone / iPad (Safari) : pas d'API d'installation, on explique la marche à suivre
  if (isIOS && !isStandalone()) {
    document.addEventListener('DOMContentLoaded', function () {
      showButton(function () {
        var msg = 'Pour installer : touchez le bouton Partager (carré avec une flèche), puis « Sur l’écran d’accueil ».';
        if (window.FFBToast) FFBToast.info(msg, { delay: 12000 }); else alert(msg);
      });
    });
  }
})();
