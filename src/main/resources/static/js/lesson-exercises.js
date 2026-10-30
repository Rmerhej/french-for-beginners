let score = 0;
let answered = 0;

// Initialisation du score affiché
document.addEventListener("DOMContentLoaded", () => {
    document.getElementById("score").textContent = score;

    // Nombre total de questions
    const totalQuestions = document.querySelectorAll("[id^='exercise-card-']").length;
    document.getElementById("total").textContent = totalQuestions;
});

function checkAnswer(btn, exerciseId, correctAnswer) {
    const card = document.getElementById(`exercise-card-${exerciseId}`);
    const checkedRadio = card.querySelector(`input[name="qcm-${exerciseId}"]:checked`);

    if (!checkedRadio) {
        (window.FFBToast ? FFBToast.warning("Veuillez sélectionner une réponse avant de vérifier.") : alert("Veuillez sélectionner une réponse avant de vérifier."));
        return;
    }

    // Texte choisi par l'utilisateur
    const userText = card.querySelector(`label[for="${checkedRadio.id}"]`).textContent.trim();

    // Nettoyage des réponses
    const cleanCorrectAnswer = String(correctAnswer).trim().toUpperCase();
    const cleanUserAnswer = userText.toUpperCase();

    const resultDiv = document.getElementById(`result-${exerciseId}`);

    // Désactive le bouton et les réponses
    btn.disabled = true;
    card.querySelectorAll(`input[name="qcm-${exerciseId}"]`)
        .forEach(input => input.disabled = true);

    resultDiv.classList.remove("d-none");
    resultDiv.classList.remove("alert-success", "alert-danger");

    // Vérification
    if (cleanUserAnswer === cleanCorrectAnswer) {

        // Incrémentation du score
        score++;
        document.getElementById("score").textContent = score;

        checkedRadio.closest(".option-container")
            .classList.add("bg-success", "text-white");

        resultDiv.classList.add("alert-success");
        resultDiv.innerHTML =
            "<strong>🎉 Correct !</strong> Excellente réponse.";

    } else {

        checkedRadio.closest(".option-container")
            .classList.add("bg-danger", "text-white");

        resultDiv.classList.add("alert-danger");
        resultDiv.innerHTML =
            `<strong>❌ Incorrect.</strong> La bonne réponse était : "${correctAnswer}".`;

        // Mise en vert de la bonne réponse
        card.querySelectorAll(".option-container").forEach(container => {
            const labelText = container.querySelector("label")
                .textContent
                .trim()
                .toUpperCase();

            if (labelText === cleanCorrectAnswer) {
                container.classList.add("bg-success", "text-white");
            }
        });
    }

    answered++;

    console.log(`Répondues : ${answered} - Score : ${score}`);

    // Enregistrement du score côté serveur (utilisateurs connectés)
    if (window.sendScore) window.sendScore(exerciseId, userText);
}