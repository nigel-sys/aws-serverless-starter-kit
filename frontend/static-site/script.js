const config = window.APP_CONFIG;

function getToken() {
  return localStorage.getItem('id_token');
}

function callApi() {
  const token = getToken();
  fetch(config.apiUrl, {
    method: 'GET',
    headers: {
      Authorization: token,
    },
  })
    .then((res) => res.json())
    .then((data) => {
      document.getElementById('response').innerText = data.message;
    })
    .catch((err) => {
      console.error(err);
      alert('Error calling API');
    });
}

function logout() {
  localStorage.removeItem('id_token');
  window.location.href = `${config.cognitoDomain}/logout?client_id=${config.clientId}&logout_uri=${config.logoutUrl}`;
}
