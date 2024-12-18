<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: 'Quicksand', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            background: #b1d9fc;
            color: #333;
        }

        .sidebar {
            width: 250px;
            background-color: #fff;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 20px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 2px 0 6px rgba(0, 0, 0, 0.1);
        }

        .sidebar h2 {
            color: #4facfe;
        }

        .logout-button {
            margin-top: auto;
            background-color: #4facfe;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-weight: 600;
            cursor: pointer;
            text-align: center;
        }

        .logout-button:hover {
            background-color: #333;
        }

        #content {
            margin-left: 250px;
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            height: 100vh;
            overflow: hidden;
        }

        .table-wrapper {
            width: 80%;
            max-height: 600px; /* Adjusted height */
            overflow-y: auto; /* Enable vertical scrolling if content overflows */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 16px; /* Increased padding */
            text-align: left;
            border: 1px solid #ddd;
            vertical-align: middle;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:nth-child(odd) {
            background-color: #ffffff;
        }

        table th {
            background-color: #4facfe;
            color: white;
        }

        table td {
            font-size: 14px;
            line-height: 1.5;
        }

        /* Styling for the delete button */
        .delete-btn {
            background-color: #f44336;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .delete-btn:hover {
            background-color: #d32f2f;
        }


/* Navbar Styles */
nav {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background-color: #027AA8;
    color: white;
    z-index: 1000;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.wrapper {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px;
}

.logo img {
    height: 100px;
    width: auto;
}

.nav-links {
    list-style-type: none;
    display: flex;
    gap: 20px;
}

.nav-links li {
    display: inline-block;
}

.nav-links a {
    text-decoration: none;
    color: white;
    font-size: 16px;
    font-weight: bold;
    transition: color 0.3s;
}

.nav-links a:hover {
    color: #FFCF40;
}

.menu-btn, .close-btn {
    display: none;
}

#menu-btn:checked ~ .nav-links {
    display: block;
}

#close-btn:checked ~ .nav-links {
    display: none;
}

/* Dropdown Styles */
#club-dropdown {
    position: relative;
}

#club-dropdown .dropdown-list {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    background-color: #027AA8;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
    list-style-type: none;
    padding: 10px 0;
}

#club-dropdown:hover .dropdown-list {
    display: block;
}

#club-dropdown .dropdown-list li {
    padding: 8px 20px;
}

#club-dropdown .dropdown-list li a {
    color: white;
    text-decoration: none;
}

#club-dropdown .dropdown-list li a:hover {
    background-color: #005F7F;
}

    </style>
</head>
<body>

<nav>
    <div class="wrapper">
        <div class="logo">
            <a href="#">
                <img src="${pageContext.request.contextPath}/images/UPES University of Petroleum and Energy Studies.png" alt="Logo" />
            </a>
        </div>  
        <ul class="nav-links">
            <label for="close-btn" class="btn close-btn">
                <i class="fas fa-times"></i>
            </label>
            <li><a href="/home">Home</a></li>
            <li><a href="/event">Events</a></li>
            <li id="club-dropdown">
                <a href="#">Clubs</a>
                <ul class="dropdown-list" id="club-dropdown-list"></ul>
            </li>
            <li id="login-link"><a href="/login">Login</a></li>
            <li id="profile-item" style="display: none;">
                <a href="#" id="logoutLink">Logout</a>
                <img src="${pageContext.request.contextPath}/images/profile.png" alt="Profile" class="profile-icon" />
                <span id="username"></span> <!-- Placeholder for user's name -->
            </li>
        </ul>
        <label for="menu-btn" class="btn menu-btn">
            <i class="fas fa-bars"></i>
        </label>
    </div>
</nav>

    <div class="sidebar">
        <h2>Admin Details</h2>
        <p>Welcome, <span id="userUsername"></span>!</p>
        <p>Role: <span id="userRole"></span></p>
        <p>Email: <span id="userEmail"></span></p>
        <button class="logout-button" id="logoutLink">Logout</button>
    </div>

    <div id="content">
        <div class="table-wrapper" id="tableContainer" style="display: none;">
            <table id="dataTable">
                <thead>
                    <tr>
                        <th>S.No.</th>
                        <th>Club Name</th>
                        <th>Club Admin</th>
                        <th>Actions</th> <!-- Delete button -->
                    </tr>
                </thead>
                <tbody>
                    <!-- Table data will be dynamically injected here -->
                </tbody>
            </table>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            const token = localStorage.getItem("token");
            const user = JSON.parse(localStorage.getItem("user"));

            if (user) {
                $("#userEmail").text(user.email);
                $("#userRole").text(user.role);
                $("#userUsername").text(user.username);
            } else {
                alert("User details not found. Please log in again.");
                window.location.href = "${pageContext.request.contextPath}/login";
            }

            function populateTable(data) {
                const tableBody = $("#dataTable tbody");
                tableBody.empty();

                // Log the received data for debugging
                console.log("Fetched club list data:", data);

                data.forEach((item, index) => {
                    const row = `<tr>
                        <td>${index + 1}</td> <!-- Sequential number -->
                        <td>${item.clubName}</td>
                        <td>${item.clubAdmin}</td>
                        <td><button class="delete-btn" data-id="${item.clubId}">Delete</button></td>
                    </tr>`;
                    tableBody.append(row);
                });
                $("#tableContainer").show();

                // Bind the delete button click event
                $(".delete-btn").on("click", function () {
                    const clubId = $(this).data("id");
                    const confirmed = confirm("Are you sure you want to delete this club?");
                    if (confirmed) {
                        deleteClub(clubId);
                    }
                });
            }

            function deleteClub(clubId) {
                if (token) {
                    $.ajax({
                        url: `${pageContext.request.contextPath}/api/clubs/delete/${clubId}`,
                        type: "DELETE",
                        headers: {
                            "Authorization": "Bearer " + token
                        },
                        success: function (response) {
                            alert("Club deleted successfully.");
                            location.reload(); // Reload the page to refresh the list
                        },
                        error: function () {
                            alert("Failed to delete club. Please try again.");
                        }
                    });
                } else {
                    alert("You need to log in to delete a club.");
                    window.location.href = "${pageContext.request.contextPath}/login";
                }
            }

            function fetchWithToken(url) {
                if (token) {
                    $.ajax({
                        url: url,
                        type: "GET",
                        headers: {
                            "Authorization": "Bearer " + token
                        },
                        success: function (response) {
                            populateTable(response);
                        },
                        error: function () {
                            alert("Failed to fetch data. Please log in again.");
                            window.location.href = "${pageContext.request.contextPath}/login";
                        }
                    });
                } else {
                    alert("You need to log in to access this page.");
                    window.location.href = "${pageContext.request.contextPath}/login";
                }
            }

            // Automatically fetch club list when the page loads
            fetchWithToken("${pageContext.request.contextPath}/api/clubs/list");

            $("#logoutLink").on("click", function () {
                localStorage.clear();
                window.location.href = "${pageContext.request.contextPath}/login";
            });
        });
    </script>
</body>
</html>
