<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register / Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

    <div class="container">
        <h1>Welcome to the Clubs Ecosystem</h1>

        <!-- Toggle between Registration and Login -->
        <div id="auth-section">
            <!-- Registration Form -->
            <div id="register-section">
                <h2>Register</h2>
                <ul>
                    <li><a href="#" id="user-tab">End User</a></li>
                    <li><a href="#" id="club-tab">Club Admin</a></li>
                </ul>

                <!-- End User Registration Form -->
                <div id="endUserRegistration" style="display: block;">
                    <form id="endUserForm" action="${pageContext.request.contextPath}/register/enduser" method="post">
                        <div>
                            <label for="endUserUsername">Username:</label>
                            <input type="text" id="endUserUsername" name="username" required>
                        </div>
                        <div>
                            <label for="endUserEmail">Email:</label>
                            <input type="email" id="endUserEmail" name="email" required>
                        </div>

                        <div>
                            <label for="endUserPassword">Password:</label>
                            <input type="password" id="endUserPassword" name="password" required>
                        </div>

                        <button type="submit">Register as End User</button>
                    </form>
                </div>

                <!-- Club Admin Registration Form -->
                <div id="clubAdminRegistration" style="display: none;">
                    <form id="clubAdminForm" action="${pageContext.request.contextPath}/register/clubadmin" method="post" enctype="multipart/form-data">
                        <!-- Club Admin User Info -->
                        <div>
                            <label for="clubAdminEmail">Email:</label>
                            <input type="email" id="clubAdminEmail" name="email" required>
                        </div>

                        <div>
                            <label for="clubAdminUsername">Username:</label>
                            <input type="text" id="clubAdminUsername" name="username" required>
                        </div>

                        <div>
                            <label for="clubAdminPassword">Password:</label>
                            <input type="password" id="clubAdminPassword" name="password" required>
                        </div>

                        <!-- Club Details -->
                        <div>
                            <label for="clubName">Club Name:</label>
                            <input type="text" id="clubName" name="clubName" required>
                        </div>

                        <div>
                            <label for="slogan">Slogan:</label>
                            <input type="text" id="slogan" name="slogan">
                        </div>

                        <div>
                            <label for="description">Description:</label>
                            <textarea id="description" name="description"></textarea>
                        </div>

                        <div>
                            <label for="logo">Logo:</label>
                            <input type="file" id="logo" name="logo">
                        </div>

                        <button type="submit">Register as Club Admin</button>
                    </form>
                </div>

                <!-- Link to Login -->
                <p>Already have an account? <a href="#" id="showLogin">Login here</a></p>
            </div>

            <!-- Login Form -->
            <div id="login-section" style="display: none;">
                <h2>Already have an account? Login</h2>
                <form id="loginForm" method="post"> <!-- Removed action attribute -->
                    <label for="loginRole">Login as:</label>
                    <select id="loginRole" name="loginRole">
                        <option value="END_USER">End User</option>
                        <option value="CLUB_ADMIN">Club Admin</option>
                        <option value="WEB_ADMIN">Web Admin</option>
                    </select>

                    <div>
                        <label for="loginEmail">Email:</label>
                        <input type="email" id="loginEmail" name="email" required>
                    </div>

                    <div>
                        <label for="loginUsername">Username:</label>
                        <input type="text" id="loginUsername" name="username" required>
                    </div>

                    <div>
                        <label for="loginPassword">Password:</label>
                        <input type="password" id="loginPassword" name="password" required>
                    </div>

                    <button type="submit">Login</button>
                </form>

                <!-- Link to Register -->
                <p>Don't have an account? <a href="#" id="showRegister">Register here</a></p>
            </div>
        </div>
    </div>

    <script>
        // Switch between End User and Club Admin tabs for registration
        $('#user-tab').on('click', function () {
            $('#endUserRegistration').show();
            $('#clubAdminRegistration').hide();
        });

        $('#club-tab').on('click', function () {
            $('#clubAdminRegistration').show();
            $('#endUserRegistration').hide();
        });

        // Show login form
        $('#showLogin').on('click', function (e) {
            e.preventDefault();
            $('#login-section').show();
            $('#register-section').hide();
        });

        // Show register form
        $('#showRegister').on('click', function (e) {
            e.preventDefault();
            $('#login-section').hide();
            $('#register-section').show();
        });

        $("#loginForm").submit(function(e) {
            e.preventDefault(); // Prevent the form from submitting the traditional way

            // Get the form data
            var loginData = {
                email: $("#loginEmail").val(),
                password: $("#loginPassword").val(),
                role: $("#loginRole").val()
            };
            console.log(loginData);

            // Make the AJAX request
            $.ajax({
                url: "http://localhost:8080/api/auth/login",  // Your API endpoint
                type: "POST",
                contentType: "application/json",  // Set content type as JSON
                data: JSON.stringify(loginData),  // Convert the data to JSON string
                success: function(response) {
                    console.log(response);  // Handle success, response should contain the token and user details
                    localStorage.setItem("token", response.token);  // Store the token in localStorage
                    window.location.href = "/";  // Redirect to the homepage or dashboard
                },
                error: function(xhr, status, error) {
                    console.error("Login failed:", error);  // Handle error
                }
            });
        });
    </script>

</body>
</html>
