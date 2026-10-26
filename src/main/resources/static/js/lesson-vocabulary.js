let currentAudio = null;
let currentButton = null;
let ttsButton = null;      // bouton « Écouter » (voix du navigateur) en cours de lecture

// Lecture à voix haute avec la voix française de l'appareil (aucun fichier audio nécessaire)
function ttsAvailable() {
    return 'speechSynthesis' in window && typeof SpeechSynthesisUtterance === 'function';
}

function stopTts() {
    if (ttsAvailable()) {
        window.speechSynthesis.cancel();
    }
    if (ttsButton) {
        ttsButton.querySelector('span').textContent = 'Écouter';
        ttsButton = null;
    }
}

function speakWord(word, btn) {
    if (!ttsAvailable() || !word) {
        return;
    }
    stopTts();
    const u = new SpeechSynthesisUtterance(word);
    u.lang = 'fr-FR';
    u.rate = 0.85;
    const french = window.speechSynthesis.getVoices().find(v => v.lang && v.lang.toLowerCase().startsWith('fr'));
    if (french) {
        u.voice = french;
    }
    if (btn) {
        ttsButton = btn;
        btn.querySelector('span').textContent = 'Arrêter';
        const reset = () => { if (ttsButton === btn) { stopTts(); } };
        u.onend = reset;
        u.onerror = reset;
    }
    window.speechSynthesis.speak(u);
}

document.addEventListener('DOMContentLoaded', () => {

    // Mots sans fichier audio : bouton « Écouter » affiché seulement si l'appareil sait lire à voix haute
    if (ttsAvailable()) {
        document.querySelectorAll('.btn-tts').forEach(btn => {
            const wrapper = btn.closest('.tts-wrapper');
            if (wrapper) {
                wrapper.hidden = false;
            }
            btn.addEventListener('click', () => {
                if (ttsButton === btn) {
                    stopTts();
                } else {
                    speakWord(btn.dataset.word, btn);
                }
            });
        });
    }

    const playButtons = document.querySelectorAll('.btn-play');

    playButtons.forEach(btn => {
        const audioUrl = btn.dataset.audioUrl;
        let audio = btn.parentElement.querySelector('audio');

        // Création de l'objet audio une seule fois
        if (!audio.src) {
            audio.src = audioUrl;
        }

        btn.addEventListener('click', () => {

            // Arrêter l'audio en cours si ce n'est pas le même
            if (currentAudio && currentAudio !== audio) {
                currentAudio.pause();
                currentAudio.currentTime = 0;

                // Reset ancien bouton
                if (currentButton) {
                    resetButton(currentButton);
                }
            }

            if (audio.paused) {
                // Lecture
                stopTts();
                audio.play().then(() => {
                    btn.classList.remove('btn-primary');
                    btn.classList.add('btn-danger');
                    btn.querySelector('i').classList.replace('bi-play-fill', 'bi-pause-fill');
                    btn.querySelector('span').textContent = 'Arrêter';

                    currentAudio = audio;
                    currentButton = btn;
                }).catch(err => {
                    console.error(err);
                    // Fichier introuvable ou illisible : on lit le mot avec la voix de l'appareil
                    speakWord(btn.dataset.word);
                });
            } else {
                // Pause
                audio.pause();
                resetButton(btn);
                if (currentAudio === audio) {
                    currentAudio = null;
                    currentButton = null;
                }
            }
        });

        // Quand l'audio se termine
        audio.addEventListener('ended', () => {
            resetButton(btn);
            if (currentAudio === audio) {
                currentAudio = null;
                currentButton = null;
            }
        });
    });
});

function resetButton(btn) {
    btn.classList.remove('btn-danger');
    btn.classList.add('btn-primary');
    btn.querySelector('i').classList.replace('bi-pause-fill', 'bi-play-fill');
    btn.querySelector('span').textContent = 'Écouter la prononciation';
}