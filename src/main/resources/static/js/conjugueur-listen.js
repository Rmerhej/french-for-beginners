/* Page du conjugueur : le bouton « Écouter » lit les conjugaisons avec la synthèse vocale du navigateur. */

// Bouton « Écouter » : lecture à voix haute avec la synthèse vocale du navigateur (si disponible)
(function () {
    if (!('speechSynthesis' in window)) { return; }
    document.querySelectorAll('.listen-btn').forEach(function (btn) {
        btn.classList.remove('d-none');
        btn.addEventListener('click', function () {
            window.speechSynthesis.cancel();
            btn.closest('.card').querySelectorAll('li').forEach(function (li) {
                var text = li.textContent.replace(/\(e\)|\(s\)/g, '').replace(/\//g, ' ').trim();
                var u = new SpeechSynthesisUtterance(text);
                u.lang = 'fr-FR';
                u.rate = 0.85;
                window.speechSynthesis.speak(u);
            });
        });
    });
})();
