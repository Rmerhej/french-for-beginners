// Mot actuellement choisi par un appui ou au clavier (alternative au glisser-déposer, utile sur téléphone)
let selectedWord = null;

function selectWord(el) {
    if (selectedWord) {
        selectedWord.classList.remove('selected');
        selectedWord.setAttribute('aria-pressed', 'false');
    }
    selectedWord = (selectedWord === el) ? null : el;
    if (selectedWord) {
        selectedWord.classList.add('selected');
        selectedWord.setAttribute('aria-pressed', 'true');
    }
}

function activateDropzone(zone) {
    if (selectedWord) {
        zone.textContent = selectedWord.textContent;
        selectWord(selectedWord);            // désélectionne
    } else if (zone.textContent) {
        zone.textContent = '';               // un appui sur une case remplie la vide
    }
}

    // Initialize each quiz container
    document.querySelectorAll('.quiz-wrapper').forEach((wrapper, index) => {
        const sentenceDiv = wrapper.querySelector('.sentence-container');
        const wordsDiv = wrapper.querySelector('.words-container');

        // Prepare sentence: replace underscores
        sentenceDiv.innerHTML = sentenceDiv.innerHTML.replace(/____/g, '<span class="dropzone"></span>');
        sentenceDiv.querySelectorAll('.dropzone').forEach((zone, n) => {
            zone.tabIndex = 0;
            zone.setAttribute('role', 'button');
            zone.setAttribute('aria-label', 'Case ' + (n + 1) + ' à remplir');
            zone.addEventListener('click', () => activateDropzone(zone));
            zone.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); activateDropzone(zone); }
            });
        });

        // Add words
        const wordsList = wordsDiv.getAttribute('data-words').split(',');
        wordsList.forEach(w => {
            const el = document.createElement('div');
            el.className = 'word';
            el.draggable = true;
            el.textContent = w.trim();
            el.tabIndex = 0;
            el.setAttribute('role', 'button');
            el.setAttribute('aria-pressed', 'false');
            el.addEventListener('click', () => selectWord(el));
            el.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); selectWord(el); }
            });
            el.addEventListener('dragstart', (e) => {
                e.dataTransfer.setData('text/plain', e.target.textContent);
                e.target.classList.add('dragging');
            });
            wordsDiv.appendChild(el);
        });
    });

    // Drag and Drop global listeners
    document.addEventListener('dragover', (e) => {
        if (e.target.classList.contains('dropzone')) {
            e.preventDefault();
            e.target.classList.add('over');
        }
    });
    document.addEventListener('dragleave', (e) => {
        if (e.target.classList.contains('dropzone')) e.target.classList.remove('over');
    });
    document.addEventListener('drop', (e) => {
        if (e.target.classList.contains('dropzone')) {
            e.preventDefault();
            e.target.textContent = e.dataTransfer.getData('text/plain');
            e.target.classList.remove('over');
        }
    });

    function checkAnswers(index) {
        const wrapper = document.querySelectorAll('.quiz-wrapper')[index];
        const zones = wrapper.querySelectorAll('.dropzone');
        const correctAnswers = wrapper.querySelector('.sentence-container').getAttribute('data-answers').split(',');

        let score = 0;
        zones.forEach((zone, i) => {
            if (zone.textContent.trim() === correctAnswers[i].trim()) {
                zone.style.backgroundColor = '#d1e7dd';
                  zone.style.color = '#0f5132';
                score++;
            } else {
                zone.style.backgroundColor = '#f8d7da';
                 zone.style.color = '#842029';
            }
        });
        document.getElementById('feedback-' + index).innerHTML =
            `<div class="alert alert-info">Ton score : ${score}/${zones.length}</div>`;

        // Quiz réussi à 100 % : proposer de continuer le parcours (utilisateur connecté)
        const next = document.getElementById('quiz-next');
        if (next && zones.length > 0 && score === zones.length) {
            const link = document.createElement('a');
            link.href = next.getAttribute('href').split('?')[0] + '#continuer-parcours';
            link.className = 'btn btn-success rounded-pill fw-bold mt-3';
            link.textContent = '🎉 Bravo ! Étape suivante ➜';
            document.getElementById('feedback-' + index).appendChild(link);
        }

        // Enregistrement du score côté serveur (le serveur recalcule la correction)
        if (window.sendQuizScore && wrapper.dataset.quizId) {
            const given = Array.from(zones).map(z => z.textContent.trim()).join('|');
            window.sendQuizScore(wrapper.dataset.quizId, given);
        }
    }

    function resetQuiz(index) {
        const wrapper = document.querySelectorAll('.quiz-wrapper')[index];
        wrapper.querySelectorAll('.dropzone').forEach(z => z.textContent = '');
        document.getElementById('feedback-' + index).innerHTML = '';
        if (selectedWord) { selectWord(selectedWord); }
    }
