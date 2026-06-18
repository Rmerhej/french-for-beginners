
    function checkAnswer(btn, exerciseId, correctAnswer) {
        const card = document.getElementById(`exercise-card-${exerciseId}`);
        const checkedRadio = card.querySelector(`input[name="qcm-${exerciseId}"]:checked`);

        if (!checkedRadio) {
            alert("Veuillez sélectionner une réponse avant de vérifier !");
            return;
        }

        // 1. On récupère le TEXTE de l'option que l'utilisateur a cochée
        const userText = card.querySelector(`label[for="${checkedRadio.id}"]`).textContent.trim();

        // 2. On nettoie proprement la bonne réponse de la BDD (gestion des majuscules/espaces)
        const cleanCorrectAnswer = String(correctAnswer).trim().toUpperCase();
        const cleanUserAnswer = userText.toUpperCase();

        const resultDiv = document.getElementById(`result-${exerciseId}`);

        // Désactiver le bouton et les inputs pour bloquer après validation
        btn.disabled = true;
        card.querySelectorAll(`input[name="qcm-${exerciseId}"]`).forEach(input => input.disabled = true);

        resultDiv.classList.remove('d-none');

        // 3. Comparaison textuelle sécurisée
        if (cleanUserAnswer === cleanCorrectAnswer) {
            checkedRadio.closest('.option-container').classList.add('bg-success', 'text-white');
            resultDiv.classList.add('alert-success');
            resultDiv.innerHTML = "<strong>🎉 Correct !</strong> Excellente réponse.";
        } else {
            checkedRadio.closest('.option-container').classList.add('bg-danger', 'text-white');
            resultDiv.classList.add('alert-danger');
            resultDiv.innerHTML = `<strong>❌ Incorrect.</strong> La bonne réponse était : "${correctAnswer}".`;

            // On cherche quelle option contenait le bon texte pour la mettre en vert
            card.querySelectorAll('.option-container').forEach(container => {
                const labelText = container.querySelector('label').textContent.trim().toUpperCase();
                if (labelText === cleanCorrectAnswer) {
                    container.classList.add('bg-success', 'text-white');
                }
            });
        }

        // 4. ENVOI AU SCORECONTROLLER (JAVA)
        const formData = new FormData();
        formData.append("userAnswer", userText); // Envoie le texte exact (ex: "un livre") à votre Java
// Récupération sécurisée des tokens CSRF depuis les balises meta
    const token = document.querySelector("meta[name='_csrf']")?.getAttribute("content");
    const header = document.querySelector("meta[name='_csrf_header']")?.getAttribute("content");
    const headers={}
    if(token && header){
    headers[header] = token;}//injecte dynamiquement "X-CSRF-TOKEN" : "la valeur"

        fetch(`/exercise/submit/${exerciseId}`, {
            method: 'POST',
            headers: headers,
            body: formData
        })
        .then(response => {
            if (response.ok) {
                console.log(`Exercice ${exerciseId} sauvegardé en BDD !`);
            } else {
                console.error("Erreur ou utilisateur non connecté.");
            }
        })
        .catch(err => console.error("Erreur réseau :", err));
    }