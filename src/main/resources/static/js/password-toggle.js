document.addEventListener('DOMContentLoaded', () => {

    // Sélectionne TOUS les boutons de toggle sur la page
    document.querySelectorAll('.toggle-password-btn').forEach(button => {

        button.addEventListener('click', () => {
            const input = button.parentElement.querySelector('input'); // Plus fiable

            if (input) {
                // Toggle entre password et text
                const newType = input.type === 'password' ? 'text' : 'password';
                input.type = newType;

                // Toggle l'icône
                const icon = button.querySelector('i');
                icon.classList.toggle('bi-eye');
                icon.classList.toggle('bi-eye-slash');
            }
        });
    });
});