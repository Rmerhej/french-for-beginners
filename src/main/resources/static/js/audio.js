
    document.addEventListener('DOMContentLoaded', () => {

        const playButtons = document.querySelectorAll('.btn-play');
        let currentAudio = null;

        playButtons.forEach(btn => {
            const audio = btn.parentElement.querySelector('audio');

            btn.addEventListener('click', () => {

                // Si un autre audio joue → on l'arrête
                if (currentAudio && currentAudio !== audio) {
                    currentAudio.pause();
                    currentAudio.currentTime = 0;

                    // Reset l'ancien bouton
                    const oldBtn = currentAudio.parentElement.querySelector('.btn-play');
                    if (oldBtn) {
                        oldBtn.innerHTML = '<i class="bi bi-play-fill fs-3"></i>';
                        oldBtn.classList.remove('btn-danger');
                        oldBtn.classList.add('btn-primary');
                    }
                }

                if (audio.paused) {
                    // Lecture
                    audio.play().then(() => {
                        btn.innerHTML = '<i class="bi bi-pause-fill fs-3"></i>';
                        btn.classList.remove('btn-primary');
                        btn.classList.add('btn-danger');
                        currentAudio = audio;
                    }).catch(err => {
                        console.error("Erreur lecture :", err);
                    });
                } else {
                    // Pause
                    audio.pause();
                    btn.innerHTML = '<i class="bi bi-play-fill fs-3"></i>';
                    btn.classList.remove('btn-danger');
                    btn.classList.add('btn-primary');
                    currentAudio = null;
                }
            });

            // Quand l'audio se termine naturellement
            audio.addEventListener('ended', () => {
                btn.innerHTML = '<i class="bi bi-play-fill fs-3"></i>';
                btn.classList.remove('btn-danger');
                btn.classList.add('btn-primary');
                if (currentAudio === audio) currentAudio = null;
            });
        });
    });
