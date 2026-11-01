/* Empêche le double envoi d'un formulaire (double clic ou double appui sur mobile).
 * Les formulaires concernés portent l'attribut data-single-submit. */
(function () {
    'use strict';

    function lock(form) {
        form.dataset.submitting = 'true';
        form.setAttribute('aria-busy', 'true');
        form.querySelectorAll('button[type="submit"]').forEach(function (btn) {
            if (!btn.dataset.label) { btn.dataset.label = btn.textContent; }
            btn.disabled = true;
            btn.textContent = 'Un instant…';
        });
    }

    function unlock(form) {
        delete form.dataset.submitting;
        form.removeAttribute('aria-busy');
        form.querySelectorAll('button[type="submit"]').forEach(function (btn) {
            btn.disabled = false;
            if (btn.dataset.label) { btn.textContent = btn.dataset.label; }
        });
    }

    document.querySelectorAll('form[data-single-submit]').forEach(function (form) {
        form.addEventListener('submit', function (event) {
            if (form.dataset.submitting === 'true') {
                event.preventDefault();
                return;
            }
            // On bloque après l'envoi, pour ne pas empêcher le navigateur de partir.
            setTimeout(function () { lock(form); }, 0);
        });
    });

    // Retour arrière : la page revient figée du cache, on rend le bouton utilisable.
    window.addEventListener('pageshow', function (event) {
        if (event.persisted) {
            document.querySelectorAll('form[data-single-submit]').forEach(unlock);
        }
    });
})();
