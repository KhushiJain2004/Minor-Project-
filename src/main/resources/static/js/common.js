async function logout() {
  try {
      const response=await fetch("/api/auth/logout", {
          method: "GET",
          credentials: "include", // Ensure cookies are included
      });

      console.log(response);
      // Clear token from localStorage (if used)
      localStorage.removeItem("token");
      localStorage.removeItem("user");

      // Redirect to login page
      window.location.href = "/login";
  } catch (error) {
      console.error("Logout failed:", error);
      toastr.error("Failed to log out. Please try again.");
  }
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


