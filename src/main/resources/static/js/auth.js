$(document).ready(function () {

    $('#showRegister').on('click', function (e) {
        e.preventDefault();
        $('#register-section').show();
        $('#login-section').hide();
    });

    $('#showLogin').on('click', function (e) {
        e.preventDefault();
        $('#login-section').show();
        $('#register-section').hide();
    });

    $('#user-tab').on('click', function () {
        $('#endUserRegistration').show();
        $('#clubAdminRegistration').hide();
    });

    $('#club-tab').on('click', function () {
        $('#clubAdminRegistration').show();
        $('#endUserRegistration').hide();
    });
    $('.role-tab').on('click', function () {
        // Remove 'active' class from all tabs
        $('.role-tab').removeClass('active');

        // Add 'active' class to the clicked tab
        $(this).addClass('active');

        // Set the selected role into the hidden input
        var selectedRole = $(this).data('role');
        $('#loginRole').val(selectedRole);
    });
   
    document.getElementById("loginForm").addEventListener("submit", async function (e) {
        e.preventDefault();
    
        console.log("Form submission prevented");
    
        const loginData = {
            email: document.getElementById("loginEmail").value,
            password: document.getElementById("loginPassword").value,
            role: document.getElementById("loginRole").value,
        };
        console.log(loginData);
    
        try {
            const response = await fetch("/api/auth/login", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(loginData),
            });
    
            if (!response.ok) {
                const errorData = await response.json();
                console.error("Login failed:", errorData);
                const errorMessage = errorData.message || "Login failed";
                toastr.error(errorMessage);
                return;
            }
    
            const responseData = await response.json();
            localStorage.setItem("token", responseData.token);
            localStorage.setItem("user", JSON.stringify(responseData.user));
            navigateToDashboard(responseData.role); // Navigate based on role
        } catch (error) {
            console.error("An error occurred during login:", error);
            toastr.error("Something went wrong. Please try again later.");
        }
    });
    
    async function navigateToDashboard(role) {
        let dashboardUrl;
    
        switch (role) {
            case "WEB_ADMIN":
                dashboardUrl = "/webAdmin/dashboard";
                break;
            case "CLUB_ADMIN":
                dashboardUrl = "/clubAdmin/dashboard";
                break;
            case "END_USER":
                dashboardUrl = "/home";
                break;
            default:
                toastr.error("Invalid role. Cannot navigate to dashboard.");
                return;
        }
    
        try {
            const response = await fetch(dashboardUrl, {
                method: "GET",
                credentials: "include", // Include cookies in the request
            });
            if (response.status === 401) {
                toastr.error("Invalid authentication. Please log in again.");
                window.location.href = "/login"; // Redirect to login
                return;
            }
    
            if (response.status === 403) {
                toastr.error("Access denied. You do not have sufficient privileges.");
                return;
            }
    
            if (!response.ok) {
                const errorData = await response.json();
                console.error("Navigation failed:", errorData);
                toastr.error("Failed to access the dashboard. Please try again.");
                return;
            }

            console.log(response);
            // Redirect to the dashboard if access is granted
            window.location.href = dashboardUrl;
        } catch (error) {
            console.error("An error occurred while navigating:", error);
            toastr.error("Something went wrong. Please try again later.");
        }
    }
    
    

    // function fetchDashboard(url) {
    //     const token = localStorage.getItem("token");
    //     console.log(token);
    //     $.ajax({
    //         url: url,
    //         type: "GET",
    //         headers: {
    //             "Authorization": "Bearer " + token
    //         },
    //         success: function (response) {
    //             console.log("Dashboard data:", response);
    //             window.location.replace(url);
    //         },
    //         error: function (xhr, status, error) {
    //             console.error("Access denied:", error);

    //             window.location.replace("/login");
    //         }
    //     });
    // }


    $(document).ready(function () {

        if (localStorage.getItem('registrationSuccess') === 'true') {
            toastr.success('Registration successful! Please log in.');
    
            localStorage.removeItem('registrationSuccess');
        }
      
        $("#endUserForm").submit(function (e) {
            e.preventDefault(); 
        
            var registrationData = {
                user: {
                    username: $("#endUserUsername").val(),
                    email: $("#endUserEmail").val(),
                    password: $("#endUserPassword").val(),
                    role: "END_USER" 
                },
                club: null 
            };
        
        
            $.ajax({
                url: "http://localhost:8080/api/auth/register",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(registrationData), 
                success: function (response) {
                    // toastr.success("Registration successful! Please log in.");
                    localStorage.setItem('registrationSuccess', 'true');
                    // localStorage.setItem('registrationSuccessMsg', 'Registration successful! Please log in.');

                    window.location.replace("http://localhost:8080/login");
                },
                error: function (xhr, status, error) {
                    console.error("End User registration failed:", error.message);
                    // console.log("XHR object:", xhr);
                    // console.log("Error object:", error);
                    const errorMessage = xhr.responseText ? xhr.responseText : "Registration failed";
                    toastr.error(errorMessage);
                }
            });
        });
        




    $("#clubAdminForm").submit(function (e) {
        e.preventDefault();
        console.log("submitted");
    
        var user = {
            username: $("#clubAdminUsername").val(),
            email: $("#clubAdminEmail").val(),
            password: $("#clubAdminPassword").val(),
            role: "CLUB_ADMIN" 
        };
    
        var club = {
            clubName: $("#clubName").val(),
            slogan: $("#slogan").val(),
            description: $("#description").val()
        };
        var clubMembers = [
            {
                name: $("#member1Name").val(),
                designation: $("#member1Designation").val()
            },
            {
                name: $("#member2Name").val(),
                designation: $("#member2Designation").val()
            },
            {
                name: $("#member3Name").val(),
                designation: $("#member3Designation").val()
            }
        ];
        var data = {
            user: user,
            club: club,
            clubMembers: clubMembers
        };
        // console.log(data);
    
        $.ajax({
            url: "http://localhost:8080/api/auth/register", 
            type: "POST",
            contentType: 'application/json; charset=UTF-8', 
            data: JSON.stringify(data), 
            success: function (response) {
              
                localStorage.setItem('registrationSuccess', 'true');
                localStorage.setItem('registrationSuccessMsg', 'Club registered successfully!! Login to access dashboard');
                window.location.replace("http://localhost:8080/login");
            },
            error: function (xhr, status, error) {
                console.error("Club Admin registration failed:", error);
                const errorMessage = xhr.responseJSON ? xhr.responseJSON.message : "Registration failed";
                toastr.error(errorMessage);
            }
        });
    });
    
});
    

});