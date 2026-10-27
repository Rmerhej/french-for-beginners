/*
 * Lecture à voix haute avec la voix française de l'appareil (aucun fichier audio nécessaire).
 * Un bouton <button class="btn-say" data-say="tu, tout" hidden> lit chaque mot, l'un après l'autre.
 * Le bouton n'apparaît que si l'appareil sait lire à voix haute.
 * Exemple de texte : "tu / tout, rue / roue" -> quatre mots lus séparément.
 */
(function () {
    'use strict';

    var available = 'speechSynthesis' in window && typeof SpeechSynthesisUtterance === 'function';
    var activeButton = null;
    var runId = 0;
    var timer = null;

    function frenchVoice() {
        var voices = window.speechSynthesis.getVoices();
        for (var i = 0; i < voices.length; i++) {
            if (voices[i].lang && voices[i].lang.toLowerCase().indexOf('fr') === 0) {
                return voices[i];
            }
        }
        return null;
    }

    function parts(text, split) {
        if (split === false) {
            return [text.trim()];
        }
        return text.split(/\s*[,;\/–—]\s*/).map(function (s) { return s.trim(); }).filter(Boolean);
    }

    function setButtonState(btn, playing) {
        if (!btn) {
            return;
        }
        var icon = btn.querySelector('i');
        var label = btn.querySelector('.say-label');
        if (icon) {
            icon.classList.toggle('bi-volume-up-fill', !playing);
            icon.classList.toggle('bi-stop-fill', playing);
        }
        if (label) {
            if (!label.dataset.idle) {
                label.dataset.idle = label.textContent;
            }
            label.textContent = playing ? 'Arrêter' : label.dataset.idle;
        }
        btn.classList.toggle('active', playing);
    }

    function stop() {
        runId++;
        if (timer) {
            clearTimeout(timer);
            timer = null;
        }
        if (available) {
            window.speechSynthesis.cancel();
        }
        setButtonState(activeButton, false);
        activeButton = null;
    }

    /** Lit une liste de mots l'un après l'autre. options : {split: false, rate: 0.8, button: élément, onend: fonction} */
    function speak(text, options) {
        options = options || {};
        if (!available || !text) {
            return;
        }
        stop();
        var list = parts(text, options.split);
        var myRun = runId;
        var voice = frenchVoice();
        activeButton = options.button || null;
        setButtonState(activeButton, true);

        function next(i) {
            if (myRun !== runId) {
                return;
            }
            if (i >= list.length) {
                setButtonState(activeButton, false);
                activeButton = null;
                if (options.onend) {
                    options.onend();
                }
                return;
            }
            var u = new SpeechSynthesisUtterance(list[i]);
            u.lang = 'fr-FR';
            u.rate = options.rate || 0.8;
            if (voice) {
                u.voice = voice;
            }
            u.onend = function () {
                timer = setTimeout(function () { next(i + 1); }, 350);
            };
            u.onerror = function () {
                if (myRun === runId) {
                    stop();
                }
            };
            window.speechSynthesis.speak(u);
        }

        next(0);
    }

    window.FFBSay = {available: available, speak: speak, stop: stop};

    document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll('.btn-say').forEach(function (btn) {
            if (!available) {
                return;
            }
            btn.hidden = false;
            btn.addEventListener('click', function () {
                if (activeButton === btn) {
                    stop();
                } else {
                    speak(btn.dataset.say, {button: btn, split: btn.dataset.nosplit === undefined});
                }
            });
        });
        // Message « votre appareil ne sait pas lire à voix haute » (pages d'écoute)
        document.querySelectorAll('.say-unavailable').forEach(function (el) {
            el.hidden = available;
        });
        document.querySelectorAll('.say-required').forEach(function (el) {
            el.hidden = !available;
        });
    });

    window.addEventListener('pagehide', stop);
})();
