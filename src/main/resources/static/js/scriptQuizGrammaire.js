
    // Initialize each quiz container
    document.querySelectorAll('.quiz-wrapper').forEach((wrapper, index) => {
        const sentenceDiv = wrapper.querySelector('.sentence-container');
        const wordsDiv = wrapper.querySelector('.words-container');

        // Prepare sentence: replace underscores
        sentenceDiv.innerHTML = sentenceDiv.innerHTML.replace(/____/g, '<span class="dropzone"></span>');

        // Add words
        const wordsList = wordsDiv.getAttribute('data-words').split(',');
        wordsList.forEach(w => {
            const el = document.createElement('div');
            el.className = 'word';
            el.draggable = true;
            el.textContent = w.trim();
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
                score++;
            } else {
                zone.style.backgroundColor = '#f8d7da';
            }
        });
        document.getElementById('feedback-' + index).innerHTML =
            `<div class="alert alert-info">Ton score : ${score}/${zones.length}</div>`;
    }

    function resetQuiz(index) {
        const wrapper = document.querySelectorAll('.quiz-wrapper')[index];
        wrapper.querySelectorAll('.dropzone').forEach(z => z.textContent = '');
        document.getElementById('feedback-' + index).innerHTML = '';
    }
