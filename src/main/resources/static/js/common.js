function logout() {
  $.ajax({
      url: '/logout', // URL for your logout endpoint
      type: 'POST', // or 'GET'
      success: function(response) {
        localStorage.removeItem("token");
        localStorage.removeItem("user");
          window.location.href = '/login'; // Redirect after logout
      },
      error: function(xhr, status, error) {
          console.error('Logout failed: ', error);
      }
  });
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

// $.ajaxSetup({
//   beforeSend: function(xhr) {
//       console.log("BeforeSend called"); // Add this for debugging
      
//       const token = localStorage.getItem("token");
      
//       if (token) {
//           console.log("Token found: ", token); // Check if token is found
//           xhr.setRequestHeader("Authorization", "Bearer " + token);
//       } else {
//           console.log("No token found in localStorage");
//       }
//   }
// });
//       ;


$(document).ajaxSend(function(event, jqxhr, settings) {
  const token = localStorage.getItem("token");

  if (token && settings.url.includes("/dashboard")) {
      jqxhr.setRequestHeader("Authorization", "Bearer " + token);
  }
});


