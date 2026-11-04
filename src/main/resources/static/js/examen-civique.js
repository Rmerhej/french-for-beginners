// QCM général de l'examen civique : une fois toutes les questions vérifiées, affiche le résultat
// (seuil de réussite de l'examen réel : 80 %, soit 32 bonnes réponses sur 40).
(function () {
    'use strict';

    var SEUIL = 0.8;
    var main = document.querySelector('[data-total-questions]');
    var totalEl = document.getElementById('total');
    var scoreEl = document.getElementById('score');
    var result = document.getElementById('exam-result');
    if (!main || !totalEl || !scoreEl || !result) return;

    var nb = parseInt(main.getAttribute('data-total-questions'), 10);
    if (!nb) return;

    function showResult() {
        var answered = parseInt(totalEl.textContent, 10) || 0;
        if (answered < nb) return;
        var score = parseInt(scoreEl.textContent, 10) || 0;
        var pct = Math.round((score / nb) * 100);
        var passed = score >= Math.ceil(nb * SEUIL);
        result.classList.remove('d-none', 'alert-success', 'alert-warning');
        result.classList.add(passed ? 'alert-success' : 'alert-warning');
        result.textContent = passed
            ? 'Bravo ! ' + score + ' bonnes réponses sur ' + nb + ' (' + pct + ' %) : vous auriez réussi l\'examen (80 % demandés).'
            : score + ' bonnes réponses sur ' + nb + ' (' + pct + ' %) : il en faut au moins 80 % pour réussir. Relisez le livret et recommencez !';
        result.scrollIntoView({behavior: 'smooth', block: 'center'});
    }

    new MutationObserver(showResult).observe(totalEl, {childList: true, characterData: true, subtree: true});
})();
