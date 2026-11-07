/* Test de niveau (A1 – B2) : correction des questions, score par niveau et affichage du résultat.
 * Utilise js/placement-level.js (calcul du niveau) ; chargé par la page evaluation.html. */

let currentScore = 0;
let totalQuestions = 0;
const answeredExercises = new Set();
// Score par niveau : {A1: {correct, total}, ...}, rempli seulement si les questions portent un niveau
const byLevel = {};

document.addEventListener("DOMContentLoaded", function() {
    const exerciseCards = document.querySelectorAll('.exercise-card');
    totalQuestions = exerciseCards.length;
    exerciseCards.forEach(function (card) {
        const level = card.dataset.level;
        if (level) {
            byLevel[level] = byLevel[level] || { correct: 0, total: 0 };
            byLevel[level].total++;
        }
    });

    const totalSpan = document.getElementById('total');
    if (totalSpan) {
        totalSpan.innerText = totalQuestions;
    }
});

function submitAndCheck(exerciseId, correctAnswer) {
    const selectedRadio = document.querySelector(`input[name="answer-${exerciseId}"]:checked`);
    const explanationDiv = document.getElementById(`explanation-${exerciseId}`);
    const cardContainer = document.getElementById(`exercise-container-${exerciseId}`);

    if (!selectedRadio) {
        (window.FFBToast ? FFBToast.warning("Veuillez sélectionner une réponse avant de vérifier.") : alert("Veuillez sélectionner une réponse avant de vérifier."));
        return;
    }

    const userAnswer = selectedRadio.value;
    const optionWrapper = selectedRadio.closest('.option-wrapper');

    if (explanationDiv) {
        explanationDiv.classList.remove('d-none');
    }

    const radios = cardContainer.querySelectorAll('input[type="radio"]');
    radios.forEach(r => r.disabled = true);
    const verifyBtn = cardContainer.querySelector('.verify-btn');
    if (verifyBtn) verifyBtn.disabled = true;

    if (!answeredExercises.has(exerciseId)) {
        answeredExercises.add(exerciseId);

        if (userAnswer === correctAnswer) {
            if (optionWrapper) optionWrapper.classList.add('correct');
            currentScore++;
            const level = cardContainer.dataset.level;
            if (level && byLevel[level]) byLevel[level].correct++;
        } else {
            if (optionWrapper) optionWrapper.classList.add('incorrect');
            const correctRadio = cardContainer.querySelector(`input[value="${correctAnswer}"]`);
            if (correctRadio) {
                correctRadio.closest('.option-wrapper').classList.add('correct');
            }
        }
    }

    document.getElementById('score').innerText = currentScore;
}

function showEvaluationResult() {
    const resultContainer = document.getElementById('evaluation-result-container');
    const levelBadge = document.getElementById('cecr-level');
    const descElement = document.getElementById('cecr-description');

    if (!resultContainer || totalQuestions === 0) {
        (window.FFBToast ? FFBToast.error("Erreur de chargement des questions. Rechargez la page.") : alert("Erreur de chargement des questions. Rechargez la page."));
        return;
    }

    resultContainer.classList.remove('d-none');

    const percentage = (currentScore / totalQuestions) * 100;
    const descriptions = {
        A1: "Niveau Débutant : Vous découvrez la langue française et comprenez des expressions très simples.",
        A2: "Niveau Élémentaire : Vous pouvez communiquer lors de tâches simples et habituelles.",
        B1: "Niveau Intermédiaire (Seuil) : Vous faites face à la majorité des situations de voyage ou d'échanges usuels.",
        B2: "Niveau Avancé (Indépendant) : Vous comprenez des textes complexes et vous exprimez avec aisance."
    };
    const detailsElement = document.getElementById('cecr-details');
    let level = "";
    let details = "";

    if (window.FFBPlacement && Object.keys(byLevel).length > 0) {
        // Calcul par niveau : chaque niveau est noté sur ses propres questions
        const r = window.FFBPlacement.compute(byLevel);
        level = r.level;
        details = "Résultat par niveau :\n" + r.scores.map(function (b) {
            return (b.ok ? "✔ " : "✖ ") + b.level + " : " + b.correct + "/" + b.total;
        }).join("\n");
        if (r.baseWeak) {
            details += "\n\nLes bases du niveau A1 sont à consolider : commencez par les cours et exercices de ce niveau.";
        } else if (r.firstGap) {
            details += "\n\nÀ travailler en priorité : le niveau " + r.firstGap + ".";
        }
        if (r.irregular) {
            details += "\n\nVotre profil est irrégulier (certains niveaux élevés réussis malgré des difficultés plus bas) : parlez-en avec votre enseignant.";
        }
    } else {
        // Questions sans niveau : calcul sur le score total
        level = percentage >= 80 ? "B2" : percentage >= 65 ? "B1" : percentage >= 50 ? "A2" : "A1";
    }
    const unanswered = totalQuestions - answeredExercises.size;
    if (unanswered > 0) {
        details += (details ? "\n\n" : "") + unanswered + " question(s) sans réponse comptée(s) comme fausse(s).";
    }

    levelBadge.innerText = level;
    descElement.innerText = descriptions[level] + " (Score : " + currentScore + "/" + totalQuestions + " - " + Math.round(percentage) + "%)";
    if (detailsElement) detailsElement.textContent = details;

    // Utilisateur connecté : on retient le niveau pour « Continuer le parcours »
    if (window.sendPlacementLevel) {
        window.sendPlacementLevel(level).then(function (saved) {
            if (saved && window.FFBToast) {
                FFBToast.success('Niveau enregistré : « Continuer le parcours » démarrera à ce niveau.');
            }
        });
    }

    resultContainer.scrollIntoView({ behavior: 'smooth' });
}
