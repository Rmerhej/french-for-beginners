// Lecteur du livret (PDF) avec un bouton « Retour au site » toujours visible.
// Adresse : /livret.html?file=/LIVRET-CITOYEN.pdf&page=5&back=/laFrance
import * as pdfjsLib from '/vendor/pdfjs-4.10.38/pdf.min.js';

pdfjsLib.GlobalWorkerOptions.workerSrc = '/vendor/pdfjs-4.10.38/pdf.worker.min.js';

const params = new URLSearchParams(location.search);

// Seulement des adresses du site lui-même (« /... », jamais « //autre-site »)
function localPath(value, fallback) {
  return value && value.startsWith('/') && !value.startsWith('//') ? value : fallback;
}
const file = localPath(params.get('file'), '/LIVRET-CITOYEN.pdf');
const back = localPath(params.get('back'), '/laFrance');
const startPage = Math.max(1, parseInt(params.get('page'), 10) || 1);

const container = document.getElementById('main-content');
const info = document.getElementById('livretInfo');
document.getElementById('livretDownload').href = file;

document.getElementById('livretBack').addEventListener('click', () => {
  // Revenir à la page précédente (même position) ; sinon, à la page d'origine
  if (history.length > 1 && document.referrer && new URL(document.referrer).origin === location.origin) {
    history.back();
  } else {
    location.href = back;
  }
});

// Netteté limitée à 2x : au-delà, les iPhone manquent de mémoire sur un document de 70 pages
const DPR = Math.min(window.devicePixelRatio || 1, 2);
const pages = [];          // { el, canvas, task }
let pdf = null;
let ratio = 1.414;         // hauteur / largeur (A4 par défaut, corrigé avec la 1re page)

function renderPage(n) {
  const p = pages[n - 1];
  p.drop = false;
  if (p.canvas || p.task) return;
  p.task = pdf.getPage(n).then((page) => {
    const base = page.getViewport({ scale: 1 });
    const width = p.el.clientWidth || container.clientWidth;
    const viewport = page.getViewport({ scale: (width / base.width) * DPR });
    const canvas = document.createElement('canvas');
    canvas.width = Math.floor(viewport.width);
    canvas.height = Math.floor(viewport.height);
    canvas.setAttribute('aria-label', 'Page ' + n);
    p.el.style.aspectRatio = base.width + ' / ' + base.height;
    return page.render({ canvasContext: canvas.getContext('2d'), viewport }).promise.then(() => {
      if (p.drop) { canvas.width = 0; canvas.height = 0; return; }   // page sortie de l'écran entre-temps
      p.el.replaceChildren(canvas);
      p.canvas = canvas;
    });
  }).catch(() => { /* page non affichée : elle sera retentée en revenant dessus */ })
    .finally(() => { p.task = null; });
}

function releasePage(n) {
  const p = pages[n - 1];
  p.drop = true;
  if (!p.canvas) return;
  p.canvas.width = 0; p.canvas.height = 0;       // libère la mémoire tout de suite (iOS)
  p.canvas = null;
  p.el.replaceChildren(numberLabel(n));
}

function numberLabel(n) {
  const s = document.createElement('span');
  s.className = 'livret-num';
  s.textContent = 'Page ' + n;
  return s;
}

function build() {
  for (let n = 1; n <= pdf.numPages; n++) {
    const el = document.createElement('div');
    el.className = 'livret-page';
    el.dataset.page = n;
    el.style.aspectRatio = '1 / ' + ratio;
    el.appendChild(numberLabel(n));
    container.appendChild(el);
    pages.push({ el, canvas: null, task: null });
  }

  // Affiche les pages proches de l'écran, libère les pages lointaines
  const near = new IntersectionObserver((entries) => {
    entries.forEach((e) => {
      const n = Number(e.target.dataset.page);
      if (e.isIntersecting) renderPage(n); else releasePage(n);
    });
  }, { rootMargin: '150% 0px' });

  // Numéro de la page affichée au centre de l'écran
  const current = new IntersectionObserver((entries) => {
    entries.forEach((e) => {
      if (e.isIntersecting) info.textContent = 'Page ' + e.target.dataset.page + ' / ' + pdf.numPages;
    });
  }, { rootMargin: '-50% 0px -50% 0px' });

  pages.forEach((p) => { near.observe(p.el); current.observe(p.el); });

  const target = pages[Math.min(startPage, pdf.numPages) - 1];
  target.el.scrollIntoView({ block: 'start' });
  info.textContent = 'Page ' + target.el.dataset.page + ' / ' + pdf.numPages;
}

pdfjsLib.getDocument({ url: file, disableAutoFetch: true, isEvalSupported: false })
  .promise
  .then((doc) => {
    pdf = doc;
    return doc.getPage(1).then((first) => {
      const v = first.getViewport({ scale: 1 });
      ratio = v.height / v.width;
    });
  })
  .then(build)
  .catch(() => {
    info.textContent = 'Impossible d’afficher le livret.';
    const a = document.createElement('a');
    a.href = file;
    a.className = 'btn btn-primary';
    a.textContent = 'Ouvrir le PDF';
    const box = document.createElement('div');
    box.className = 'text-center py-5';
    box.appendChild(a);
    container.replaceChildren(box);
  });
