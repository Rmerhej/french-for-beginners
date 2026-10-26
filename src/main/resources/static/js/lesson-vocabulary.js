let currentAudio = null;
let currentButton = null;
let ttsButton = null;       // bouton (mot ou phrase) en cours de lecture avec la voix du navigateur
let ttsIdleLabel = '';     // texte à remettre sur ce bouton quand la lecture s'arrête

// Lecture à voix haute avec la voix française de l'appareil (aucun fichier audio nécessaire)
function ttsAvailable() {
    return 'speechSynthesis' in window && typeof SpeechSynthesisUtterance === 'function';
}

function stopTts() {
    if (ttsAvailable()) {
        window.speechSynthesis.cancel();
    }
    if (ttsButton) {
        ttsButton.querySelector('span').textContent = ttsIdleLabel;
        ttsButton = null;
    }
}

// Lit un texte (mot ou phrase). btn : bouton qui passe en « Arrêter » pendant la lecture.
function speakText(text, btn) {
    if (!ttsAvailable() || !text) {
        return;
    }
    stopTts();
    const u = new SpeechSynthesisUtterance(text);
    u.lang = 'fr-FR';
    u.rate = 0.85;
    const french = window.speechSynthesis.getVoices().find(v => v.lang && v.lang.toLowerCase().startsWith('fr'));
    if (french) {
        u.voice = french;
    }
    if (btn) {
        ttsButton = btn;
        ttsIdleLabel = btn.querySelector('span').textContent;
        btn.querySelector('span').textContent = 'Arrêter';
        const reset = () => { if (ttsButton === btn) { stopTts(); } };
        u.onend = reset;
        u.onerror = reset;
    }
    window.speechSynthesis.speak(u);
}

function speakWord(word, btn) {
    speakText(word, btn);
}

// Arrête le fichier audio en cours (avant de lire une phrase avec la voix du navigateur)
function stopRecordedAudio() {
    if (currentAudio) {
        currentAudio.pause();
        currentAudio.currentTime = 0;
        if (currentButton) {
            resetButton(currentButton);
        }
        currentAudio = null;
        currentButton = null;
    }
}

function bindTtsButton(btn, textOf) {
    btn.addEventListener('click', () => {
        if (ttsButton === btn) {
            stopTts();
        } else {
            stopRecordedAudio();
            speakText(textOf(btn), btn);
        }
    });
}

document.addEventListener('DOMContentLoaded', () => {

    // Boutons de voix du navigateur : affichés seulement si l'appareil sait lire à voix haute
    if (ttsAvailable()) {
        // Mots sans fichier audio
        document.querySelectorAll('.btn-tts').forEach(btn => {
            const wrapper = btn.closest('.tts-wrapper');
            if (wrapper) {
                wrapper.hidden = false;
            }
            bindTtsButton(btn, b => b.dataset.word);
        });
        // Phrase utile (tous les mots, avec ou sans fichier audio)
        document.querySelectorAll('.btn-sentence').forEach(btn => {
            btn.hidden = false;
            btn.classList.add('d-inline-flex');
            bindTtsButton(btn, b => b.dataset.sentence);
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