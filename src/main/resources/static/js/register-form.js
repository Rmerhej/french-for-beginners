/* Inscription : la case « données fictives » n'est rouge que si on essaie de valider sans l'avoir cochée,
 * et redevient normale dès qu'elle est cochée. */
(function () {
    'use strict';

    var box = document.getElementById('confirmPseudo');
    if (!box) { return; }

    // Déclenché par le navigateur quand le formulaire est envoyé alors que la case obligatoire est vide
    box.addEventListener('invalid', function () {
        box.classList.add('is-invalid');
    });

    box.addEventListener('change', function () {
        box.classList.toggle('is-invalid', !box.checked);
    });
})();
