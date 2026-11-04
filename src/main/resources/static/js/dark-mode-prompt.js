// Proposition du mode sombre à toute personne qui arrive sur le site, connectée ou non (notification avec deux boutons).
//  - « Activer »          : passe en mode sombre (même effet que le bouton « Sombre » du menu) ;
//  - « Ne plus afficher » : mémorise le choix dans ce navigateur, la proposition ne revient plus ;
//  - croix                : ferme seulement ; la proposition revient à la prochaine visite.
// Une seule fois par visite (onglet), dès l'arrivée sur le site. Rien n'est affiché si le
// mode sombre est déjà actif. Le stockage du navigateur peut être indisponible : tout est protégé.
(function () {
  'use strict';

  var KEY_OFF = 'darkPromptOff';     // localStorage : « ne plus afficher »
  var KEY_SEEN = 'darkPromptSeen';   // sessionStorage : déjà proposé pendant cette visite
  var DELAY = 600;                   // laisse la page s'afficher d'abord

  function read(store, key) {
    try { return window[store].getItem(key); } catch (e) { return null; }
  }
  function write(store, key, value) {
    try { window[store].setItem(key, value); } catch (e) { /* stockage indisponible : on continue */ }
  }

  function activateDarkMode() {
    var toggle = document.getElementById('darkModeToggle');
    if (toggle) {
      toggle.click();                                    // même chemin que le bouton du menu
    } else {
      write('localStorage', 'theme', 'dark');
      window.location.reload();
    }
  }

  function propose() {
    if (!window.FFBToast) return;
    if (document.documentElement.getAttribute('data-bs-theme') === 'dark') return;
    if (read('localStorage', KEY_OFF) === '1') return;
    if (read('sessionStorage', KEY_SEEN) === '1') return;
    write('sessionStorage', KEY_SEEN, '1');

    window.FFBToast.show(
      'Le mode sombre est plus reposant pour les yeux, surtout le soir. Voulez-vous l’activer ?',
      'info',
      {
        delay: 25000,
        actions: [
          { label: 'Activer le mode sombre', primary: true, onClick: activateDarkMode },
          { label: 'Ne plus afficher', onClick: function () { write('localStorage', KEY_OFF, '1'); } }
        ]
      }
    );
  }

  function start() { setTimeout(propose, DELAY); }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', start);
  else start();
})();
