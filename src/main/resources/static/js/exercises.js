    let score = 0;
    let answered = 0;

    function submitAndCheck(exerciseId, correctAnswer) {
        // 1. Trouver le conteneur de l'exercice actuel
        const container = document.getElementById(`exercise-container-${exerciseId}`);

        // 2. Récupérer l'option cochée (A, B, C ou D)
        const selectedRadio = container.querySelector(`input[name="answer-${exerciseId}"]:checked`);

        // Sécurité : si l'utilisateur n'a rien coché et clique sur vérifier
        if (!selectedRadio) {
            alert("Veuillez sélectionner une réponse avant de vérifier !");
            return;
        }

        const selectedValue = selectedRadio.value; // Ex: "A"
        const selectedWrapper = selectedRadio.closest('.option-wrapper');
        const button = container.querySelector('button');

        // Désactiver le bouton et les radios pour éviter le double-clic
        button.disabled = true;
        container.querySelectorAll('input[type="radio"]').forEach(radio => radio.disabled = true);

        answered++;

        // 3. Logique visuelle (Vert si juste, Rouge si faux)
        if (selectedValue === correctAnswer) {
            selectedWrapper.classList.add('correct');
            score++;
        } else {
            selectedWrapper.classList.add('incorrect');
            // Afficher aussi en vert où était la bonne réponse
            const correctRadio = container.querySelector(`input[value="${correctAnswer}"]`);
            correctRadio.closest('.option-wrapper').classList.add('correct');
        }

        // Afficher l'explication
        container.querySelector('.explanation').classList.remove('d-none');

        // Mettre à jour les compteurs globaux à l'écran
        document.getElementById('score').textContent = score;
        document.getElementById('total').textContent = answered;

        // 4. Enregistrement du score côté serveur (utilisateurs connectés)
        const selectedText = selectedWrapper.querySelector('label').textContent.trim();
        if (window.sendScore) window.sendScore(exerciseId, selectedText);
    }