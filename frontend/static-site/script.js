function getToken() {
  return localStorage.getItem('id_token');
}

function callApi() {
  const token = getToken();
  fetch('https://khz5e0eygg.execute-api.us-east-1.amazonaws.com/prod/hello', {
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
  const domain =
    'https://serverless-starter-auth-domain-577d5819.auth.us-east-1.amazoncognito.com';
  const clientId = '55403cj4qov65aesp1ri848jeq';
  const logoutUrl = 'http://d2h6dh0ek3z5t8.cloudfront.net/index.html';

  localStorage.removeItem('id_token');
  window.location.href = `${domain}/logout?client_id=${clientId}&logout_uri=${logoutUrl}`;
}
