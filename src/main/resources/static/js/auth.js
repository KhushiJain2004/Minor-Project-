$(document).ready(function() {
    // Show register form
    $('#showRegister').on('click', function (e) {
        e.preventDefault();
        $('#register-section').show();
        $('#login-section').hide();
    });

    // Show login form
    $('#showLogin').on('click', function (e) {
        e.preventDefault();
        $('#login-section').show();
        $('#register-section').hide();
    });

    // Switch between End User and Club Admin tabs for registration
    $('#user-tab').on('click', function () {
        $('#endUserRegistration').show();
        $('#clubAdminRegistration').hide();
    });

    $('#club-tab').on('click', function () {
        $('#clubAdminRegistration').show();
        $('#endUserRegistration').hide();
    });

    // Handle login form submission with AJAX
    $("#loginForm").submit(function (e) {
        e.preventDefault(); // Prevent the form from submitting the traditional way

        // Get the form data
        var loginData = {
            email: $("#loginEmail").val(),
            password: $("#loginPassword").val(),
            role: $("#loginRole").val()
        };

        // Make the AJAX request
        $.ajax({
            url: "localhost://8080/api/auth/login", // Your API endpoint
            type: "POST",
            contentType: "application/json", // Set content type as JSON
            data: JSON.stringify(loginData), // Convert the data to JSON string
            success: function (response) {
                // Handle success, response should contain the token and user details
                localStorage.setItem("token", response.token); // Store the token in localStorage

                // Redirect based on user role
                switch (response.role) {
                    case 'WEB_ADMIN':
                        window.location.href = "/webAdmin/dashboard"; // Redirect to Web Admin dashboard
                        break;
                    case 'CLUB_ADMIN':
                        window.location.href = "/dashboard"; // Redirect to Club Admin dashboard
                        break;
                    default:
                        window.location.href = "/home"; // Redirect to home page
                        break;
                }
            },
            error: function (xhr) {
                console.error("Login failed:", xhr); // Handle error
                toastr.error("Login failed: " + xhr.responseJSON.error); // Display error message using toastr
            }
        });
    });

    // Check if 'status' is set and display the toastr notification
    <c:if test="${not empty status}">
        toastr.info('${status}');
    </c:if>
});
