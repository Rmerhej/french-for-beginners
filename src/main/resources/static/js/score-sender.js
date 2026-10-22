// Enregistrement des scores des QCM (utilisateurs connectés) et repères « déjà réussi ».
// Chargé sur toutes les pages par le pied de page ; les scripts de QCM appellent sendScore().
(function () {
  var csrf = null;          // { headerName, parameterName, token } reçu du serveur
  var noticeShown = false;

  function findToken() {
    if (csrf && csrf.token) {
      return csrf;
    }
    var meta = document.querySelector("meta[name='_csrf']");
    if (meta) {
      var headerMeta = document.querySelector("meta[name='_csrf_header']");
      return { token: meta.getAttribute('content'), headerName: headerMeta ? headerMeta.getAttribute('content') : 'X-XSRF-TOKEN', parameterName: '_csrf' };
    }
    var input = document.getElementById('csrfToken') || document.querySelector("input[name='_csrf']");
    if (input && input.value) {
      return { token: input.value, headerName: 'X-XSRF-TOKEN', parameterName: input.name || '_csrf' };
    }
    return null;
  }

  // Pages sans jeton de sécurité intégré (ex. quiz glisser-déposer) : on le demande au serveur.
  function ensureToken() {
    if (findToken()) {
      return Promise.resolve();
    }
    return fetch('/exercise/my-results', { credentials: 'same-origin', headers: { 'Accept': 'application/json' } })
      .then(jsonOrNull)
      .then(function (data) { if (data && data.csrf) csrf = data.csrf; })
      .catch(function () { /* silencieux */ });
  }

  function jsonOrNull(res) {
    var type = res.headers.get('content-type') || '';
    if (res.redirected || res.status === 401 || res.status === 403 || !res.ok || type.indexOf('json') === -1) {
      return null;
    }
    return res.json();
  }

  function showLoginNotice() {
    if (noticeShown) return;
    noticeShown = true;
    var box = document.createElement('div');
    box.className = 'alert alert-info alert-dismissible fade show mx-auto mt-3';
    box.style.maxWidth = '820px';
    box.setAttribute('role', 'status');
    box.innerHTML = '🔒 <a href="/login">Connectez-vous</a> pour enregistrer vos scores et suivre votre progression.' +
      '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Fermer"></button>';
    var host = document.querySelector('main') || document.body;
    host.insertBefore(box, host.firstChild);
  }

  function exerciseContainers() {
    return document.querySelectorAll("[id^='exercise-container-'], [id^='exercise-card-']");
  }

  function containerFor(exerciseId) {
    return document.getElementById('exercise-container-' + exerciseId) || document.getElementById('exercise-card-' + exerciseId);
  }

  function setBadge(exerciseId, success) {
    var container = containerFor(exerciseId);
    if (!container) return;
    var old = container.querySelector('.score-badge');
    if (old) old.remove();
    var span = document.createElement('div');
    span.className = 'score-badge mb-2';
    span.innerHTML = success
      ? '<span class="badge text-bg-success">✅ Déjà réussi</span>'
      : '<span class="badge text-bg-warning">🔁 À revoir</span>';
    var body = container.querySelector('.card-body') || container;
    body.insertBefore(span, body.firstChild);
  }

  // Envoie la réponse choisie ; le serveur la corrige et l'enregistre.
  window.sendScore = function (exerciseId, userAnswer) {
    return ensureToken().then(function () { return doSendScore(exerciseId, userAnswer); });
  };

  function doSendScore(exerciseId, userAnswer) {
    var token = findToken();
    var body = new URLSearchParams();
    body.append('userAnswer', userAnswer);
    var headers = { 'Content-Type': 'application/x-www-form-urlencoded' };
    if (token && token.token) {
      body.append(token.parameterName || '_csrf', token.token);
      headers[token.headerName || 'X-XSRF-TOKEN'] = token.token;
    }
    return fetch('/exercise/submit/' + encodeURIComponent(exerciseId), {
      method: 'POST',
      credentials: 'same-origin',
      headers: headers,
      body: body.toString()
    }).then(function (res) {
      if (res.redirected || res.status === 401) {
        showLoginNotice();
        return null;
      }
      return jsonOrNull(res);
    }).then(function (data) {
      if (data && typeof data.correct === 'boolean') {
        setBadge(exerciseId, data.correct);
      }
      return data;
    }).catch(function () { return null; });
  }

  // Quiz glisser-déposer : answers = réponses séparées par « | », dans l'ordre des zones.
  window.sendQuizScore = function (quizId, answers) {
    return ensureToken().then(function () { return doSendQuizScore(quizId, answers); });
  };

  function doSendQuizScore(quizId, answers) {
    var token = findToken();
    var body = new URLSearchParams();
    body.append('answers', answers);
    var headers = { 'Content-Type': 'application/x-www-form-urlencoded' };
    if (token && token.token) {
      body.append(token.parameterName || '_csrf', token.token);
      headers[token.headerName || 'X-XSRF-TOKEN'] = token.token;
    }
    return fetch('/quiz/submit/' + encodeURIComponent(quizId), {
      method: 'POST',
      credentials: 'same-origin',
      headers: headers,
      body: body.toString()
    }).then(function (res) {
      if (res.redirected || res.status === 401) {
        showLoginNotice();
        return null;
      }
      return jsonOrNull(res);
    }).catch(function () { return null; });
  }

  // Au chargement : récupère les exercices déjà réussis (et le jeton de sécurité).
  document.addEventListener('DOMContentLoaded', function () {
    if (exerciseContainers().length === 0) return;
    fetch('/exercise/my-results', { credentials: 'same-origin', headers: { 'Accept': 'application/json' } })
      .then(jsonOrNull)
      .then(function (data) {
        if (!data) {
          showLoginNotice();
          return;
        }
        if (data.csrf) csrf = data.csrf;
        var ok = {};
        (data.successfulIds || []).forEach(function (id) { ok[id] = true; });
        (data.attemptedIds || []).forEach(function (id) { setBadge(id, !!ok[id]); });
      })
      .catch(function () { /* silencieux */ });
  });
})();
