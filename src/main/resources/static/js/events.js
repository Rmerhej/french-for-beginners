/* Gestionnaires d'événements communs à tout le site.
 *
 * Ils remplacent les attributs onclick="..." et onsubmit="..." écrits dans les pages. Ces attributs
 * obligent à autoriser les scripts « en ligne » dans la politique de sécurité (CSP) ; avec ce fichier,
 * les pages décrivent seulement ce qu'elles veulent, par des attributs data-* :
 *
 *   data-click="nomDeFonction"   appelle la fonction globale de ce nom au clic
 *   data-arg0="…" data-arg1="…"  arguments passés à la fonction (toujours du texte)
 *   data-click-self="true"       passe d'abord l'élément cliqué (équivalent de « this »)
 *   data-confirm="Question ?"    demande confirmation avant un clic sur un lien/bouton
 *                                ou avant l'envoi d'un formulaire (Annuler = rien ne se passe)
 *
 * Pour des raisons de sécurité, seules les fonctions de la liste ACTIONS peuvent être appelées :
 * du HTML injecté ne pourrait donc pas lancer n'importe quelle fonction de la page.
 * Pour en autoriser une nouvelle, l'ajouter à la liste (le test InlineHandlersTest vérifie
 * que chaque data-click des pages figure bien ici). */
(function () {
    'use strict';

    var ACTIONS = [
        'checkAnswer',
        'checkAnswers',
        'resetQuiz',
        'showEvaluationResult',
        'submitAndCheck'
    ];

    function argsOf(el) {
        var args = [];
        if (el.dataset.clickSelf === 'true') {
            args.push(el);
        }
        for (var i = 0; el.dataset['arg' + i] !== undefined; i++) {
            args.push(el.dataset['arg' + i]);
        }
        return args;
    }

    document.addEventListener('click', function (event) {
        var target = event.target;
        if (!target || !target.closest) {
            return;
        }

        var confirmEl = target.closest('[data-confirm]');
        if (confirmEl && confirmEl.tagName !== 'FORM' && !window.confirm(confirmEl.dataset.confirm)) {
            event.preventDefault();
            return;
        }

        var actionEl = target.closest('[data-click]');
        if (!actionEl) {
            return;
        }
        var name = actionEl.dataset.click;
        if (ACTIONS.indexOf(name) === -1 || typeof window[name] !== 'function') {
            return;
        }
        window[name].apply(window, argsOf(actionEl));
    });

    document.addEventListener('submit', function (event) {
        var form = event.target;
        if (form && form.matches && form.matches('form[data-confirm]') && !window.confirm(form.dataset.confirm)) {
            event.preventDefault();
        }
    });
})();
