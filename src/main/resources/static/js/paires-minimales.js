/*
 * Jeu d'écoute des paires minimales : un mot est lu, la personne choisit celui qu'elle a entendu.
 * Les mots viennent du tableau de la page (lignes <tr data-words="tu,tout">).
 */
(function () {
    'use strict';

    var ROUNDS = 10;

    document.addEventListener('DOMContentLoaded', function () {
        var box = document.getElementById('quiz-choices');
        if (!box || !window.FFBSay || !window.FFBSay.available) {
            return;
        }
        var rows = Array.prototype.map.call(document.querySelectorAll('tr[data-words]'), function (tr) {
            return tr.dataset.words.split(',');
        });
        if (rows.length === 0) {
            return;
        }

        var listen = document.getElementById('quiz-listen');
        var progress = document.getElementById('quiz-progress');
        var feedback = document.getElementById('quiz-feedback');
        var next = document.getElementById('quiz-next');
        var restart = document.getElementById('quiz-restart');
        var current = null;   // {words, answer}
        var round = 0;
        var score = 0;
        var answered = false;
        var lastRow = -1;

        function say(word) {
            window.FFBSay.speak(word, {split: false, rate: 0.75});
        }

        function newQuestion() {
            var i;
            do {
                i = Math.floor(Math.random() * rows.length);
            } while (i === lastRow && rows.length > 1);
            lastRow = i;
            var words = rows[i];
            current = {words: words, answer: words[Math.floor(Math.random() * words.length)]};
            answered = false;
            round++;
            progress.textContent = 'Question ' + round + ' sur ' + ROUNDS + ' · Score : ' + score;
            feedback.textContent = '';
            feedback.className = 'fw-semibold mb-3';
            next.hidden = true;
            restart.hidden = true;
            listen.hidden = false;
            box.innerHTML = '';
            words.forEach(function (w) {
                var b = document.createElement('button');
                b.type = 'button';
                b.className = 'btn btn-outline-secondary btn-lg';
                b.textContent = w;
                b.addEventListener('click', function () { choose(b, w); });
                box.appendChild(b);
            });
            say(current.answer);
        }

        function choose(button, word) {
            if (answered) {
                return;
            }
            answered = true;
            var good = word === current.answer;
            if (good) {
                score++;
                feedback.textContent = 'Bravo ! C\'était bien « ' + current.answer + ' ».';
                feedback.className = 'fw-semibold mb-3 text-success';
                button.className = 'btn btn-success btn-lg';
            } else {
                feedback.textContent = 'Pas tout à fait : c\'était « ' + current.answer + ' ».';
                feedback.className = 'fw-semibold mb-3 text-danger';
                button.className = 'btn btn-danger btn-lg';
                Array.prototype.forEach.call(box.children, function (b) {
                    if (b.textContent === current.answer) {
                        b.className = 'btn btn-success btn-lg';
                    }
                });
            }
            progress.textContent = 'Question ' + round + ' sur ' + ROUNDS + ' · Score : ' + score;
            if (round >= ROUNDS) {
                feedback.textContent += ' Résultat final : ' + score + ' sur ' + ROUNDS + '.';
                restart.hidden = false;
                listen.hidden = true;
            } else {
                next.hidden = false;
            }
        }

        listen.addEventListener('click', function () {
            if (current) {
                say(current.answer);
            } else {
                newQuestion();
            }
        });
        next.addEventListener('click', newQuestion);
        restart.addEventListener('click', function () {
            round = 0;
            score = 0;
            newQuestion();
        });

        // Avant la première question : le bouton lance le jeu
        listen.innerHTML = '<i class="bi bi-play-fill" aria-hidden="true"></i> Commencer le jeu';
        listen.addEventListener('click', function once() {
            listen.removeEventListener('click', once);
            listen.innerHTML = '<i class="bi bi-volume-up-fill" aria-hidden="true"></i> Réécouter le mot';
        });
    });
})();
