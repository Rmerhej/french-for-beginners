/* Petites notifications (« toasts ») : remplacent les fenêtres alert() du navigateur.
 *
 * Dans un script :   FFBToast.show("Texte", "success")      types : success, info, warning, error
 * Dans une page HTML (message venant du serveur) :
 *     <div hidden data-ffb-toast="success" th:text="${success}"></div>
 *   -> le message s'affiche en notification au chargement de la page.
 *
 * Accessibilité : la zone est annoncée par les lecteurs d'écran (aria-live), la notification se ferme
 * seule (plus longtemps pour une erreur), se ferme aussi au clic sur la croix, et reste affichée
 * tant que la souris ou le doigt est dessus. Le texte est inséré avec textContent (pas de HTML). */
(function () {
  'use strict';
  if (window.FFBToast) return;

  var TYPES = {
    success: { icon: 'bi-check-circle-fill', delay: 5000, role: 'status' },
    info:    { icon: 'bi-info-circle-fill', delay: 6000, role: 'status' },
    warning: { icon: 'bi-exclamation-triangle-fill', delay: 7000, role: 'status' },
    error:   { icon: 'bi-x-octagon-fill', delay: 9000, role: 'alert' }
  };
  var MAX_VISIBLE = 3;

  function normalizeType(type) {
    if (type === 'danger') return 'error';
    return TYPES[type] ? type : 'info';
  }

  function zone() {
    var z = document.getElementById('ffb-toasts');
    if (z) return z;
    z = document.createElement('div');
    z.id = 'ffb-toasts';
    z.className = 'toast-container ffb-toasts';
    z.setAttribute('aria-live', 'polite');
    z.setAttribute('aria-atomic', 'false');
    document.body.appendChild(z);
    return z;
  }

  function remove(el) {
    if (!el || !el.parentNode) return;
    el.classList.remove('show');
    el.classList.add('ffb-toast-out');
    setTimeout(function () { if (el.parentNode) el.parentNode.removeChild(el); }, 250);
  }

  function show(message, type, options) {
    if (!message || !document.body) return null;
    var t = normalizeType(type);
    var conf = TYPES[t];
    var delay = (options && options.delay) || conf.delay;

    var z = zone();
    while (z.children.length >= MAX_VISIBLE) z.removeChild(z.firstChild);

    var el = document.createElement('div');
    el.className = 'toast show ffb-toast ffb-toast-' + t;
    el.setAttribute('role', conf.role);

    var icon = document.createElement('i');
    icon.className = 'bi ' + conf.icon + ' ffb-toast-icon';
    icon.setAttribute('aria-hidden', 'true');

    var text = document.createElement('div');
    text.className = 'ffb-toast-text';
    text.textContent = String(message);

    var close = document.createElement('button');
    close.type = 'button';
    close.className = 'ffb-toast-close';
    close.setAttribute('aria-label', 'Fermer la notification');
    close.textContent = '\u00d7';   // croix en texte : s'affiche même si les icônes Bootstrap ne sont pas chargées
    close.addEventListener('click', function () { remove(el); });

    el.appendChild(icon);
    el.appendChild(text);
    el.appendChild(close);
    z.appendChild(el);

    var timer = null;
    function start() { timer = setTimeout(function () { remove(el); }, delay); }
    function stop() { if (timer) { clearTimeout(timer); timer = null; } }
    el.addEventListener('mouseenter', stop);
    el.addEventListener('touchstart', stop, { passive: true });
    el.addEventListener('mouseleave', start);
    el.addEventListener('touchend', start, { passive: true });
    start();
    return el;
  }

  window.FFBToast = {
    show: show,
    success: function (m, o) { return show(m, 'success', o); },
    info: function (m, o) { return show(m, 'info', o); },
    warning: function (m, o) { return show(m, 'warning', o); },
    error: function (m, o) { return show(m, 'error', o); }
  };

  // Messages envoyés par le serveur dans la page : <div hidden data-ffb-toast="success">...</div>
  function fromPage() {
    var nodes = document.querySelectorAll('[data-ffb-toast]');
    for (var i = 0; i < nodes.length; i++) {
      show((nodes[i].textContent || '').trim(), nodes[i].getAttribute('data-ffb-toast'));
    }
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', fromPage);
  else fromPage();
})();
