// Signal de présence : compte les visiteurs « en ligne » du tableau de bord.
// Chargé par l'en-tête de certaines pages ET par le pied de page de toutes : un seul signal par page,
// sinon deux requêtes partent en même temps avant que le cookie existe et un même visiteur est compté deux fois.
(function () {
    if (window.__ffbHeartbeat) return;
    window.__ffbHeartbeat = true;

    function sendHeartbeat() {
        fetch('/visitor/heartbeat', {
            method: 'GET',
            credentials: 'same-origin'   // important pour envoyer/recevoir les cookies
        }).catch(function () { /* erreur réseau ignorée */ });
    }

    sendHeartbeat();                       // au chargement de la page
    setInterval(sendHeartbeat, 25000);     // puis toutes les 25 secondes
})();
