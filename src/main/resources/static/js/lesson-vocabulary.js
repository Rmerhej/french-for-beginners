let currentAudio = null;
let currentButton = null;

document.addEventListener('DOMContentLoaded', () => {

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
                audio.play().then(() => {
                    btn.classList.remove('btn-primary');
                    btn.classList.add('btn-danger');
                    btn.querySelector('i').classList.replace('bi-play-fill', 'bi-pause-fill');
                    btn.querySelector('span').textContent = 'Arrêter';

                    currentAudio = audio;
                    currentButton = btn;
                }).catch(err => console.error(err));
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