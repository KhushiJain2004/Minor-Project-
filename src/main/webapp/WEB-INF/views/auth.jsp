<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register / Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth.css">
    <script>
        var contextPath = '${pageContext.request.contextPath}';
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/js/auth.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    
</head>
<body>

    <div class="container">
        <h1>Welcome to the Clubs Ecosystem</h1>
        <c:if test="${not empty status}">
                toastr.info('${status}');
            </c:if>

        <!-- Toggle between Registration and Login -->
        <div id="auth-section">
            <!-- Login Form -->
            <div id="login-section" style="display: block;">  <!-- Make the login section visible by default -->
                <form id="loginForm" action="#" method="post"> <!-- Removed action attribute -->
                    <label for="loginRole">Login as:</label>
                    <div id="loginRoleTabs" class="role-tabs">
                        <button type="button" data-role="END_USER" class="role-tab active">User</button>
                        <button type="button" data-role="CLUB_ADMIN" class="role-tab">Club Admin</button>
                        <button type="button" data-role="WEB_ADMIN" class="role-tab">Web Admin</button>
                    </div>
                    
                    <!-- Hidden input to store the selected role value -->
                    <input type="hidden" id="loginRole" name="role" value="END_USER">

                    <div>
                        <label for="loginEmail">Email:</label>
                        <input type="email" id="loginEmail" name="email" required>
                    </div>

                    <div>
                        <label for="loginPassword">Password:</label>
                        <input type="password" id="loginPassword" name="password" required>
                    </div>

                    <button type="submit">Login</button>
                </form>
                <p>Don't have an account? <a href="#" id="showRegister">Register here</a></p>
            </div>

            <!-- Registration Form -->
            <div id="register-section" style="display: none;">
                <ul id="registerRoleTabs" class="role-tabs">
                    <li><a href="#" id="user-tab" class="role-tab active">User</a></li>
                    <li><a href="#" id="club-tab" class="role-tab">Club Admin</a></li>
                </ul>

                <!-- End User Registration Form -->
                <div id="endUserRegistration" style="display: block;">
                    <form id="endUserForm" action="${pageContext.request.contextPath}/api/auth/register" method="post">
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
                <div id="clubAdminRegistration" style="display: none;" >
                    <form id="clubAdminForm" action="${pageContext.request.contextPath}/api/auth/register" method="post">
                        <div class="clubRegister">
                            <div class="admin">
                                <h3>Club Admin Details</h3>
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
                            </div>
                            <div class="clubDetails">
                                <h3>Club Details</h3>
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
                            </div>
                        </div>
                            <div class="members">
                                <h3>Club Members</h3>
                                <div class="memberBox">
                                    <label for="member1Name">Member 1 Name:</label>
                                    <input type="text" id="member1Name" name="members[0].name" required>
                                    <label for="member1Designation">Designation:</label>
                                    <input type="text" id="member1Designation" name="members[0].designation" required>
                                </div>
                                <div class="memberBox">
                                    <label for="member2Name">Member 2 Name:</label>
                                    <input type="text" id="member2Name" name="members[1].name" required>
                                    <label for="member2Designation">Designation:</label>
                                    <input type="text" id="member2Designation" name="members[1].designation" required>
                                </div>
                                <div class="memberBox">
                                    <label for="member3Name">Member 3 Name:</label>
                                    <input type="text" id="member3Name" name="members[2].name" required>
                                    <label for="member3Designation">Designation:</label>
                                    <input type="text" id="member3Designation" name="members[2].designation" required>
                                </div>
                            </div>
                        <button type="submit">Register as Club Admin</button>
                    </form>
                </div>

                <p>Already have an account? <a href="#" id="showLogin">Login here</a></p>
            </div>
        </div>
    </div>

    <!-- <script>
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

        $(document).ready(function () {
    $("#loginForm").submit(function (e) {
        e.preventDefault(); // Prevent the default form submission behavior

        console.log("Form submission prevented");

        // Collect form data
        var loginData = {
            email: $("#loginEmail").val(),
            password: $("#loginPassword").val(),
            role: $("#loginRole").val()
        };
        console.log(loginData);

        // Make the AJAX request
        $.ajax({
            url: "${pageContext.request.contextPath}/api/auth/login", // Your API endpoint
            type: "POST",
            contentType: "application/json", // Send as JSON
            data: JSON.stringify(loginData), // Convert the data to JSON
            success: function (response) {
                // Store token and handle success
                console.log(response)
                localStorage.setItem("token", response.token);
                localStorage.setItem("user",JSON.stringify(response.user));
                
                
            // Redirect based on user role
            switch (response.role) {
                case 'WEB_ADMIN':
                    // window.location.replace("/webAdmin/dashboard");
                    fetchDashboard("${pageContext.request.contextPath}/webAdmin/dashboard")
                    break;
                case 'CLUB_ADMIN':
                    // window.location.replace("/dashboard");
                    fetchDashboard("${pageContext.request.contextPath}/clubAdmin/dashboard")
                    break;
                default:
                    fetchDashboard("${pageContext.request.contextPath}/home")
                    break;
            }
            },
            error: function (xhr, status, error) {
                console.error("Login failed:", error);
                const errorMessage = xhr.responseJSON ? xhr.responseJSON.message : "Bad credentials";
                toastr.error(errorMessage ||"Login failed"); // Error handling
            }
        });
    });

    function fetchDashboard(url) {
        const token = localStorage.getItem("token");
        console.log(token);
        $.ajax({
            url: url, 
            type: "GET",
            headers: {
                "Authorization": "Bearer " + token
            },
            success: function (response) {
                console.log("Dashboard data:", response);
            
                console.log("success logging in ")
                window.location.replace(url);
            },
            error: function (xhr, status, error) {
                console.error("Access denied:", error);
            console.error("XHR response:", xhr);
                // Redirect to login if access denied
                window.location.replace("/login");
            }
        });
    }
});

    
    </script> -->

</body>
</html>
