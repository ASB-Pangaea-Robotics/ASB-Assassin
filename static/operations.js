window.addEventListener('DOMContentLoaded', function () {
  const name    = localStorage.getItem('user_name');
  const picture = localStorage.getItem('user_picture');

  if (!name) {
    window.location.href = 'login.html';
    return;
  }

  document.getElementById('nav-username').textContent = name;

  const avatar = document.getElementById('nav-avatar');
  avatar.src = picture;
  avatar.style.display = 'block';
});

function signOut() {
    localStorage.removeItem('user_name');
    localStorage.removeItem('user_email');
    localStorage.removeItem('user_picture');

    google.accounts.id.disableAutoSelect();

    window.location.href = 'login.html';
}

fetch('/api/operations')
  .then(response => response.json())
  .then(data => {
    console.log('Backend Response: ', data);

    document.querySelector('.target-image').src = data.target_image;
    document.querySelector('.target-name').textContent = data.target_name;
    document.querySelector('.target-grade-badge').textContent = data.target_grade;
  })
  .catch(error => {
    console.error('Login: FAILED', error);
  })