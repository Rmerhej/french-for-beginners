/* Bouton « Retour » (revient à la page précédente du site, sinon à l'accueil).
 * Chargé par le fragment back-to-top.html. */

(function () {
    var btn = document.getElementById('btn-back');
    if (!btn) return;

    // Pas de bouton sur la page d'accueil
    var path = location.pathname.replace(/\/+$/, '') || '/';
    if (path === '/' || path === '/index') return;

    btn.hidden = false;

    btn.addEventListener('click', function () {
        // On revient en arrière seulement si la page précédente est sur ce site ;
        // sinon (lien externe, application installée, favori) on va à l'accueil.
        var sameSite = false;
        try {
            sameSite = !!document.referrer && new URL(document.referrer).origin === location.origin;
        } catch (e) { /* ignore */ }

        if (sameSite && history.length > 1) {
            history.back();
        } else {
            location.href = '/';
        }
    });
})();
