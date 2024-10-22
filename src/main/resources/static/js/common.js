
function logout() {
    console.log("hello from logout");
    // Clear local storage
    localStorage.removeItem("token");
    localStorage.removeItem("user");
    
    // Redirect to the logout endpoint
    window.location.href = "http://localhost:8080/logout"; // Adjust the URL as needed
}
// navbar.js
document.addEventListener("DOMContentLoaded", function () {
  const user = JSON.parse(localStorage.getItem('user'));
  const profileItem = document.getElementById('profile-item');
const usernameSpan = document.getElementById('username');


  if (user) {
      document.getElementById('login-link').style.display = 'none';
      document.getElementById('profile-item').style.display = 'flex';
      document.getElementById('username').textContent = user.username;
  } else {
      document.getElementById('login-link').style.display = 'block';
      document.getElementById('profile-item').style.display = 'none';
  }

  profileItem.addEventListener('click',function (args) {
    const role=user.role;
    switch (role) {
      case 'WEB_ADMIN':
          window.location.replace("/webAdmin/dashboard");
          break;
      case 'CLUB_ADMIN':
          window.location.replace("/clubAdmin/dashboard");
          break;
      default:
          window.location.replace("/home");
          break;
  }
  })
});


