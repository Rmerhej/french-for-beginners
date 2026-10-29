/* Calcul du niveau du test de positionnement, bloc par bloc.
 * Chaque niveau (A1, A2, B1, B2) est noté sur ses propres questions : un niveau est « validé »
 * quand au moins les deux tiers des questions du bloc sont réussies (10 sur 15).
 * Le niveau annoncé est le plus haut niveau validé, à condition que tous les niveaux précédents le soient aussi :
 * de bonnes réponses aux questions difficiles ne compensent pas des bases fragiles.
 * Utilisation : FFBPlacement.compute({A1: {correct: 12, total: 15}, A2: {...}, ...}) */
(function (root) {
    var ORDER = ['A1', 'A2', 'B1', 'B2'];
    var PASS_RATIO = 2 / 3;

    function compute(blocks) {
        var result = { level: 'A1', scores: [], firstGap: null, irregular: false, baseWeak: false };
        var chain = true;
        ORDER.forEach(function (level) {
            var b = blocks[level];
            if (!b || !b.total) return;                       // niveau absent du test
            var need = Math.ceil(b.total * PASS_RATIO);
            var ok = b.correct >= need;
            result.scores.push({ level: level, correct: b.correct, total: b.total, need: need, ok: ok });
            if (chain && ok) {
                result.level = level;
            } else if (chain) {
                chain = false;
                result.firstGap = level;                      // premier niveau non validé
                if (level === ORDER[0] || result.scores.length === 1) result.baseWeak = true;
            } else if (ok) {
                result.irregular = true;                      // un niveau plus haut réussi malgré un trou plus bas
            }
        });
        return result;
    }

    var api = { compute: compute, ORDER: ORDER };
    root.FFBPlacement = api;
    if (typeof module !== 'undefined' && module.exports) module.exports = api;
})(typeof window !== 'undefined' ? window : globalThis);
