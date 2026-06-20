let score = 0;
let answered = 0;

function submitAndCheck(exerciseId, correctAnswer) {
    // 1. Trouver le conteneur principal
    const container = document.getElementById(`exercise-container-${exerciseId}`);
    if (!container) {
        console.error("Conteneur non trouvé pour l'ID:", exerciseId);
        return;
    }

    // 2. Récupérer l'option cochée
    const selectedRadio = container.querySelector(`input[name="answer-${exerciseId}"]:checked`);

    if (!selectedRadio) {
        alert("Veuillez sélectionner une réponse avant de vérifier !");
        return;
    }

    const selectedValue = selectedRadio.value.trim().toString();
    const targetValue = String(correctAnswer).trim();

    // Désactiver l'interface
    const button = container.querySelector('button');
    button.disabled = true;
    container.querySelectorAll('input[type="radio"]').forEach(radio => radio.disabled = true);

    answered++;

    // 3. Logique de comparaison
    const selectedWrapper = selectedRadio.closest('.option-wrapper');

    if (selectedValue.toUpperCase() === targetValue.toUpperCase()) {
        selectedWrapper.classList.add('correct');
        score++;
    } else {
        selectedWrapper.classList.add('incorrect');
        // Marquer la bonne réponse en vert
        const correctRadio = container.querySelector(`input[value="${correctAnswer}"]`);
        if (correctRadio) {
            correctRadio.closest('.option-wrapper').classList.add('correct');
        }
    }

    // Afficher l'explication
    const explanationDiv = document.getElementById(`explanation-${exerciseId}`);
    if (explanationDiv) {
        explanationDiv.classList.remove('d-none');
    }

    // Mettre à jour les compteurs
    if (document.getElementById('score')) document.getElementById('score').textContent = score;
    if (document.getElementById('total')) document.getElementById('total').textContent = answered;

    // 4. Envoi au serveur
    const formData = new FormData();
    formData.append("userAnswer", selectedValue);

    fetch(`/exercise/submit/${exerciseId}`, {
        method: 'POST',
        headers: { 'X-CSRF-TOKEN': document.getElementById("csrfToken")?.value || "" },
        body: formData
    })
    .then(response => {
        if (!response.ok) throw new Error("Erreur serveur");
        console.log(`Exercice ${exerciseId} enregistré.`);
    })
    .catch(error => console.error("Erreur réseau :", error));
}