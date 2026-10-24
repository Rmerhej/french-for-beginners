// Accessibilité : lien « Aller au contenu » et cible du lien, sur toutes les pages.
document.addEventListener('DOMContentLoaded', function () {
  var target = document.getElementById('main-content');
  if (!target) {
    target = document.querySelector('main') || document.querySelector('.container');
    if (target) { target.id = 'main-content'; }
  }
  if (!target) { return; }
  target.setAttribute('tabindex', '-1');
  if (!document.querySelector('.skip-link')) {
    var link = document.createElement('a');
    link.href = '#main-content';
    link.className = 'skip-link';
    link.textContent = 'Aller au contenu principal';
    document.body.insertBefore(link, document.body.firstChild);
  }
});
