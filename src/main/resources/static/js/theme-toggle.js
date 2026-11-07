/* Bouton « Sombre / Clair » du site et thème mémorisé.
 * Chargé par le pied de page de toutes les pages (avant, ce code était écrit directement dans la page). */

(function() {

    // 1. Appliquer le thème immédiatement
    // (le stockage du navigateur peut être bloqué, par exemple en navigation privée : on continue sans)
    let savedTheme = 'light';
    try { savedTheme = localStorage.getItem('theme') || 'light'; } catch (e) { /* thème clair par défaut */ }
    document.documentElement.setAttribute('data-bs-theme', savedTheme);

    function initThemeToggle() {

        const toggleButton = document.getElementById('darkModeToggle');
        const themeIcon = document.getElementById('themeIcon');
        const themeText = document.getElementById('themeText');

        // Appliquer le background
        applyBackground(savedTheme);

        if (!toggleButton) return;

        updateButtonUI(savedTheme);

        toggleButton.addEventListener('click', () => {

            const currentTheme =
                document.documentElement.getAttribute('data-bs-theme');

            const newTheme =
                currentTheme === 'dark' ? 'light' : 'dark';

            document.documentElement.setAttribute(
                'data-bs-theme',
                newTheme
            );

            try { localStorage.setItem('theme', newTheme); } catch (e) { /* non mémorisé */ }

            // Changer le background
            applyBackground(newTheme);

            updateButtonUI(newTheme);
        });

        function updateButtonUI(theme) {

            if (theme === 'dark') {

                if (themeIcon) themeIcon.textContent = '☀️';
                if (themeText) themeText.textContent = 'Clair';

                toggleButton.classList.remove('btn-outline-secondary');
                toggleButton.classList.add('btn-outline-light');

            } else {

                if (themeIcon) themeIcon.textContent = '🌙';
                if (themeText) themeText.textContent = 'Sombre';

                toggleButton.classList.remove('btn-outline-light');
                toggleButton.classList.add('btn-outline-secondary');
            }
        }

        function applyBackground(theme) {

            if (theme === 'dark') {
                document.body.style.backgroundColor = '#0d47a1';
                document.body.style.color = '#fff';
            } else {
                document.body.style.backgroundColor = '#f8f9fa';
                document.body.style.color = '#212529';
            }
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener(
            'DOMContentLoaded',
            initThemeToggle
        );
    } else {
        initThemeToggle();
    }

})();
