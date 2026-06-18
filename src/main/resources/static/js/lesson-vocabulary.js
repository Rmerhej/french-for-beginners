
  function playAudio(url) {
        console.log("Lecture audio demandée :", url);

        if (!url) {
            alert("Aucun audio disponible pour ce mot.");
            return;
        }

        try {
            const audio = new Audio(url);
            audio.play()
                .then(() => {
                    console.log("✅ Lecture démarrée");
                })
                .catch(err => {
                    console.error("Erreur lecture :", err);
                    alert("Impossible de lire l'audio.\nVérifiez que le fichier existe.");
                });
        } catch (e) {
            console.error("Erreur :", e);
            alert("Erreur lors de la tentative de lecture.");
        }
    }