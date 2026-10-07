// Appel immédiat au chargement de la page
function sendHeartbeat() {
    fetch('/visitor/heartbeat', {
        method: 'GET',
        credentials: 'same-origin'   // important pour envoyer/recevoir les cookies
    }).catch(err => console.error('Erreur heartbeat', err));
}

// Premier appel
sendHeartbeat();

// Puis toutes les 25 secondes
setInterval(sendHeartbeat, 25000);