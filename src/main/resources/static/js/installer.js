/* Page « Installer l'application » : ouvre la rubrique qui correspond à l'appareil du visiteur. */

// Ouvre automatiquement la rubrique qui correspond à l'appareil du visiteur
(function () {
    var ua = navigator.userAgent;
    var isIOS = /iPad|iPhone|iPod/.test(ua) || (navigator.platform === 'MacIntel' && navigator.maxTouchPoints > 1);
    var id = isIOS ? 'install-ios' : (/Android/i.test(ua) ? 'install-android' : 'install-desktop');
    var el = document.getElementById(id);
    if (el) {
        el.classList.add('show');
        var btn = document.querySelector('[data-bs-target="#' + id + '"]');
        if (btn) {
            btn.classList.remove('collapsed');
            btn.setAttribute('aria-expanded', 'true');
        }
    }
})();
