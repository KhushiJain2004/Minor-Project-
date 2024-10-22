<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login/Signup</title>
    <style>
         body {
            font-family: 'Poppins', sans-serif;
            background-color: #E2F3FB;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: url('bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .container {
            background: rgba(255, 255, 255, 0.8);  
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
        }

        #login-form, #signup-options, #admin-signup, #user-signup {
            display: none;
        }
        #login-form, #signup-options, #admin-signup, #user-signup {
            margin: auto;
            padding: 20px;
            height: auto;  
            max-height: 80vh; 
            overflow: hidden; 
            overflow-y: scroll;
            scrollbar-width: none;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-group label {
            display: block;
            font-weight: 500;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="password"],
        .form-group input[type="tel"],
        .form-group select {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 0 auto;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: block;
            box-sizing: border-box;
        }

        .keywords {
            display: flex;
            flex-wrap: wrap;
        }
        .keyword-option {
            display: flex;
            align-items: center;
            margin-right: 10px;
            margin-bottom: 10px;
        }
        .keyword-option input[type="checkbox"] {
            appearance: none;
            width: 20px;
            height: 20px;
            border: 1px solid #027AA8;
            margin-right: 10px;
            cursor: pointer;
            background-color: white;
        }
        .keyword-option input[type="checkbox"]:checked {
            background-color: #027AA8;
        }

        .toggle-form {
            cursor: pointer;
            color: #027AA8;
            margin-top: 15px;
            text-decoration: underline;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #027AA8;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #015f85;
        }

        .toggle-form {
            cursor: pointer;
            color: #027AA8;
            margin-top: 15px;
            text-decoration: underline;
        }

        .error {
            color: red;
            font-size: 12px;
            display: none;
        }

        .signup-option {
            cursor: pointer;
            background-color: #027AA8;
            color: #ffffff;
            padding: 10px;
            border: 1px solid #027AA8;
            margin: 10px 0;
            border-radius: 5px;
            text-align: center;
        }

    </style>
</head>
<body>
    <div class="container">
        <!-- Common Login Form -->
        <div id="login-form">
            <h2>LOGIN</h2>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="login-username" placeholder="Enter your username">
                <div id="login-username-error" class="error">Username is required.</div>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="login-password" placeholder="Enter your password">
                <div id="login-password-error" class="error">Password is required.</div>
            </div>
            <button onclick="login()">Login</button>
            <div class="toggle-form" onclick="showSignupOptions()">Don't have an account? Sign up</div>
        </div>

        <!-- Signup Options -->
        <div id="signup-options">
            <h2>CHOOSE SIGNUP OPTION</h2>
            <div class="signup-option" onclick="showAdminSignup()">Club Admin Signup</div>
            <div class="signup-option" onclick="showUserSignup()">User Signup</div>
            <div class="toggle-form" onclick="showLogin()">Already have an account? Login</div>
        </div>

        <!-- Club Admin Signup Form -->
        <div id="admin-signup">
            <h2>CLUB ADMIN SIGNUP</h2>
            <div class="form-group">
                <label for="club-name">Club Name</label>
                <input type="text" id="admin-signup-club-name" placeholder="Enter your club name">
                <div id="admin-signup-club-name-error" class="error">Club name is required.</div>
            </div>
            <div class="form-group">
                <label for="admin-email">Email</label>
                <input type="email" id="admin-signup-email" placeholder="Enter your email">
                <div id="admin-signup-email-error" class="error">Valid email is required.</div>
            </div>
            <div class="form-group">
                <label for="admin-phone">Phone Number</label>
                <input type="tel" id="admin-signup-phone" placeholder="Enter your phone number">
                <div id="admin-signup-phone-error" class="error">Valid phone number is required.</div>
            </div>
            <div class="form-group">
                <label>Select Club Keywords (Max 3)</label>
                <div class="keywords">
                    <div class="keyword-option">
                        <input type="checkbox" id="keyword-music" value="Music" class="keyword-checkbox">
                        <label for="keyword-music">Music</label>
                    </div>
                    <div class="keyword-option">
                        <input type="checkbox" id="keyword-acting" value="Acting" class="keyword-checkbox">
                        <label for="keyword-acting">Acting</label>
                    </div>
                    <div class="keyword-option">
                        <input type="checkbox" id="keyword-sports" value="Sports" class="keyword-checkbox">
                        <label for="keyword-sports">Sports</label>
                    </div>
                    <div class="keyword-option">
                        <input type="checkbox" id="keyword-technology" value="Technology" class="keyword-checkbox">
                        <label for="keyword-technology">Technology</label>
                    </div>
                    <div class="keyword-option">
                        <input type="checkbox" id="keyword-art" value="Art" class="keyword-checkbox">
                        <label for="keyword-art">Art</label>
                    </div>
                    <div class="keyword-option">
                        <input type="checkbox" id="keyword-coding" value="Coding" class="keyword-checkbox">
                        <label for="keyword-coding">Coding</label>
                    </div>
                    <div class="keyword-option">
                        <input type="checkbox" id="keyword-poetry" value="Poetry" class="keyword-checkbox">
                        <label for="keyword-poetry">Poetry</label>
                    </div>
                </div>
                <div id="signup-keywords-error" class="error">Select up to 3 keywords.</div>
            </div>
            <div class="form-group">
                <label for="other">Other (if applicable)</label>
                <input type="text" id="signup-other" placeholder="Enter other club type">
            </div>
            <div class="form-group">
                <label for="admin-password">Password</label>
                <input type="password" id="admin-signup-password" placeholder="Enter your password">
                <div id="admin-signup-password-error" class="error">Password is required.</div>
            </div>
            <div class="form-group">
                <label for="admin-confirm-password">Confirm Password</label>
                <input type="password" id="admin-signup-confirm-password" placeholder="Confirm your password">
                <div id="admin-signup-confirm-password-error" class="error">Passwords must match.</div>
            </div>
            <button onclick="adminSignup()">Sign Up</button>
            <div class="toggle-form" onclick="showSignupOptions()">Back to Signup Options</div>
        </div>

        <!-- User Signup Form -->
        <div id="user-signup">
            <h2>USER SIGNUP</h2>
            <div class="form-group">
                <label for="user-name">Name</label>
                <input type="text" id="user-signup-name" placeholder="Enter your full name">
                <div id="user-signup-name-error" class="error">Full name is required.</div>
            </div>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="signup-username" placeholder="Enter your username">
                <div id="signup-username-error" class="error">Username is required.</div>
            </div>
            <div class="form-group">
                <label for="user-email">Email</label>
                <input type="email" id="user-signup-email" placeholder="Enter your email">
                <div id="user-signup-email-error" class="error">Valid email is required.</div>
            </div>
            <div class="form-group">
                <label for="course">Course</label>
                <input type="text" id="signup-course" placeholder="Enter your course">
                <div id="signup-course-error" class="error">Course is required.</div>
            </div>
            <div class="form-group">
                <label for="semester">Semester</label>
                <input type="text" id="signup-semester" placeholder="Enter your semester">
                <div id="signup-semester-error" class="error">Semester is required.</div>
            </div>
            <div class="form-group">
                <label for="user-phone">Phone Number</label>
                <input type="tel" id="user-signup-phone" placeholder="Enter your phone number">
                <div id="user-signup-phone-error" class="error">Valid phone number is required.</div>
            </div>
            <div class="form-group">
                <label>Select Club Keywords (Max 3)</label>
                <div class="keywords">
                    <div class="keyword-option">
                        <input type="checkbox" id="keyword-music" value="Music" class="keyword-checkbox">
                        <label for="keyword-music">Music</label>
                    </div>
                    <div class="keyword-option">
                        <input type="checkbox" id="keyword-acting" value="Acting" class="keyword-checkbox">
                        <label for="keyword-acting">Acting</label>
                    </div>
                    <div class="keyword-option">
                        <input type="checkbox" id="keyword-sports" value="Sports" class="keyword-checkbox">
                        <label for="keyword-sports">Sports</label>
                    </div>
                    <div class="keyword-option">
                        <input type="checkbox" id="keyword-technology" value="Technology" class="keyword-checkbox">
                        <label for="keyword-technology">Technology</label>
                    </div>
                    <div class="keyword-option">
                        <input type="checkbox" id="keyword-art" value="Art" class="keyword-checkbox">
                        <label for="keyword-art">Art</label>
                    </div>
                    <div class="keyword-option">
                        <input type="checkbox" id="keyword-coding" value="Coding" class="keyword-checkbox">
                        <label for="keyword-coding">Coding</label>
                    </div>
                    <div class="keyword-option">
                        <input type="checkbox" id="keyword-poetry" value="Poetry" class="keyword-checkbox">
                        <label for="keyword-poetry">Poetry</label>
                    </div>
                    <div id="signup-interests-error" class="error">Please select your interests.</div>
                </div>
                <div id="signup-keywords-error" class="error">Select up to 3 keywords.</div>
            </div>
            <div class="form-group">
                <label for="other">Other (if applicable)</label>
                <input type="text" id="signup-other" placeholder="Enter other club type">
            </div>
            <div class="form-group">
                <label for="user-password">Password</label>
                <input type="password" id="user-signup-password" placeholder="Enter your password">
                <div id="user-signup-password-error" class="error">Password is required.</div>
            </div>
            <div class="form-group">
                <label for="user-confirm-password">Confirm Password</label>
                <input type="password" id="user-signup-confirm-password" placeholder="Confirm your password">
                <div id="user-signup-confirm-password-error" class="error">Passwords must match.</div>
            </div>
            <button onclick="userSignup()">Sign Up</button>
            <div class="toggle-form" onclick="showSignupOptions()">Back to Signup Options</div>
        </div>
    </div>

    <script>
        // Show login form by default
        document.getElementById('login-form').style.display = 'block';

        // Toggle functions to show different forms
        function showSignupOptions() {
            document.getElementById('login-form').style.display = 'none';
            document.getElementById('signup-options').style.display = 'block';
            document.getElementById('admin-signup').style.display = 'none';
            document.getElementById('user-signup').style.display = 'none';
        }

        function showLogin() {
            document.getElementById('login-form').style.display = 'block';
            document.getElementById('signup-options').style.display = 'none';
            document.getElementById('admin-signup').style.display = 'none';
            document.getElementById('user-signup').style.display = 'none';
        }

        function showAdminSignup() {
            document.getElementById('admin-signup').style.display = 'block';
            document.getElementById('signup-options').style.display = 'none';
        }

        function showUserSignup() {
            document.getElementById('user-signup').style.display = 'block';
            document.getElementById('signup-options').style.display = 'none';
        }

        // Placeholder functions for actual form logic
        function login() {
            // Handle login logic
        }

        function adminSignup() {
            // Handle admin signup logic
        }

        function userSignup() {
            // Handle user signup logic
        }
    </script>
</body>
</html>
