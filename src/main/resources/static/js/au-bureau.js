let score = 0;
let answered = 0;

function submitAndCheck(exerciseId, correctAnswer) {
    // 1. Trouver le conteneur principal
    const container = document.getElementById(`exercise-container-${exerciseId}`);
        const selectedRadio = container.querySelector(`input[name="answer-${exerciseId}"]:checked`);
 if (!selectedRadio) {
         alert("Veuillez sélectionner une réponse !");
         return;
     }
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

    // Trouver le wrapper (la div parente) en toute sécurité
    const selectedWrapper = selectedRadio.closest('.option-wrapper');
   if (!selectedWrapper) {
           console.error("ERREUR : L'élément avec la classe 'option-wrapper' est introuvable autour du radio bouton cliqué.");
           console.log("Radio sélectionné :", selectedRadio);
           alert("Erreur de structure HTML : la classe 'option-wrapper' est manquante.");
           return;
       }

    const selectedValue = selectedRadio.value;
    const button = container.querySelector('button');

    // Désactiver l'interface
    button.disabled = true;
    container.querySelectorAll('input[type="radio"]').forEach(radio => radio.disabled = true);

    answered++;

    // 3. Logique de comparaison (trim/toUpperCase pour la robustesse)
    const isCorrect = selectedValue.trim().toUpperCase() === String(correctAnswer).trim().toUpperCase();

   //////////////
// Comparaison (on force en string pour être sûr)
    if (String(selectedValue).trim().toUpperCase() === String(correctAnswer).trim().toUpperCase()) {
        selectedWrapper.classList.add('correct');
        score++;
    } else {
        selectedWrapper.classList.add('incorrect');
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
    const selectedText = selectedWrapper.querySelector('label').textContent.trim();
    const formData = new FormData();
    formData.append("userAnswer", selectedText);
fetch(`/exercise/submit/${exerciseId}`, {
        method: 'POST',
        headers: { 'X-CSRF-TOKEN': document.getElementById("csrfToken")?.value },
        body: formData
    }).catch(err => console.error(err));
}


   )
    .then(response => {
        if (!response.ok) throw new Error("Erreur serveur");
        console.log(`Exercice ${exerciseId} enregistré avec succès.`);
    })
    .catch(error => console.error("Erreur réseau :", error));
}