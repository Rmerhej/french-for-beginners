/* Quiz « phrase à compléter » (glisser-déposer des mots). Les mots et les bonnes réponses viennent de la page :
 * listes cachées #quiz-words et #quiz-answers (voir quiz.html). */


    const words = Array.from(document.querySelectorAll('#quiz-words li')).map(li => li.textContent);
    const correctAnswers = Array.from(document.querySelectorAll('#quiz-answers li')).map(li => li.textContent);

    function prepareSentence() {
        const sentenceContainer = document.getElementById('sentence');
        // On remplace les ____ par la dropzone
        sentenceContainer.innerHTML = sentenceContainer.innerHTML.replace(/____/g, '<span class="dropzone"></span>');
    }

    function initDragAndDrop() {
        const container = document.getElementById('wordsContainer');
        container.innerHTML = '';

        words.forEach(word => {
            const div = document.createElement('div');
            div.className = 'word';
            div.draggable = true;
            div.textContent = word.trim();
            div.addEventListener('dragstart', (e) => {
                e.dataTransfer.setData('text/plain', e.target.textContent);
                e.target.classList.add('dragging');
            });
            div.addEventListener('dragend', (e) => e.target.classList.remove('dragging'));
            container.appendChild(div);
        });

        document.querySelectorAll('.dropzone').forEach(zone => {
            zone.addEventListener('dragover', (e) => { e.preventDefault(); e.currentTarget.classList.add('over'); });
            zone.addEventListener('dragleave', (e) => e.currentTarget.classList.remove('over'));
            zone.addEventListener('drop', (e) => {
                e.preventDefault();
                e.currentTarget.textContent = e.dataTransfer.getData('text/plain');
                e.currentTarget.classList.remove('over');
            });
        });
    }

    function dragStart(e) {
        e.dataTransfer.setData('text/plain', e.target.textContent);
        e.target.classList.add('dragging');
    }
    function dragOver(e) { e.preventDefault(); e.currentTarget.classList.add('over'); }
    function dragLeave(e) { e.currentTarget.classList.remove('over'); }
    function drop(e) {
        e.preventDefault();
        e.currentTarget.textContent = e.dataTransfer.getData('text/plain');
        e.currentTarget.classList.remove('over');
    }
   function checkAnswers() {
        const zones = document.querySelectorAll('.dropzone');
        let score = 0;
        let filled = true;
   zones.forEach((zone, i) => {
            const answer = zone.textContent.trim();
            if (!answer) filled = false;
            if (answer === correctAnswers[i]) {
                zone.style.backgroundColor = '#d1e7dd';
                zone.style.borderColor = '#198754';
                score++;
            } else {
                zone.style.backgroundColor = '#f8d7da';
                zone.style.borderColor = '#dc3545';
            }
        });

        const fb = document.getElementById('feedback');
        if (!filled) {
            fb.innerHTML = `<div class="alert alert-warning">Remplis toutes les cases !</div>`;
        } else if (score === correctAnswers.length) {
            fb.innerHTML = `<div class="alert alert-success"><strong>Bravo !</strong> Tu as tout juste.</div>`;
        } else {
            fb.innerHTML = `<div class="alert alert-info">Tu as ${score}/${correctAnswers.length} bonnes réponses.</div>`;
        }
    }

    function resetQuiz() {
        document.querySelectorAll('.dropzone').forEach(z => {
            z.textContent = '';
            z.style.backgroundColor = '';
            z.style.borderColor = '';
        });
        document.getElementById('feedback').innerHTML = '';
    }

    //function checkAnswers() { /* ... votre logique actuelle ... */ }
   // function resetQuiz() { /* ... votre logique actuelle ... */ }
window.checkAnswers = checkAnswers;
    window.resetQuiz = resetQuiz;
    // Initialisation unique et propre
    window.onload = function() {
        prepareSentence();
        initDragAndDrop();
    };
