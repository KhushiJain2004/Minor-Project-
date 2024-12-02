<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Events</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/js/events.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            font-family: Arial, sans-serif;
        }

        /* Page Layout */
        .page-container {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .content-wrap {
            flex: 1 0 auto;
            padding-top: 90px; /* Adjust based on navbar height */
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

        /* Event Filters */
        .event-filters {
            max-width: 80%;
            margin: 20px auto;
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        .event-filters input,
        .event-filters select {
            padding: 10px;
            border: 1px solid #027AA8;
            border-radius: 5px;
            min-width: 200px;
        }

        /* Event Section */
        .event-section {
            max-width: 80%;
            margin: 20px auto;
        }

        .event-section h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #027AA8;
            text-align: center;
        }

        .event-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .event-card {
            background-image: url('images/event.jpg');
            flex: 1 1 calc(30% - 20px);
            background-color: #ffffff;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            display: flex;
            flex-direction: column;
        }

        .event-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        .event-card-header {
            display: flex;
            align-items: center;
            padding: 15px;
            background-color: #f4f4f4;
        }

        .event-logo {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
            border: 3px solid #027AA8;
        }

        .event-card img.event-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .event-details {
            padding: 15px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .event-details h3 {
            margin: 0 0 10px 0;
            font-size: 18px;
            color: #027AA8;
        }

        .event-description {
            font-size: 14px;
            color: #555;
            margin-bottom: 15px;
            flex-grow: 1;
        }

        .read-more-btn {
            align-self: flex-start;
            background-color: #027AA8;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .read-more-btn:hover {
            background-color: #005F7F;
        }

        /* Footer Styles */
        .footer {
            margin-top: 60px;
            margin-right: 60px;
            background-color: #027AA8;
            color: white;
            padding: 50px;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 100%;
            min-height: 80px;
        }

        .footer-content {
            width: 80%;
            text-align: center;
            margin: 0 auto;
        }

        .middle p {
            margin: 5px 0;
            color: white;
            font-size: 16px;
            line-height: 1.5;
        }

        .middle a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            margin-top: 10px;
            display: inline-block;
            transition: color 0.3s ease, text-decoration 0.3s ease;
        }

        .middle a:hover {
            text-decoration: underline;
        }

        .footer-line {
            width: 80%;
            margin: 15px auto;
            border: 0.5px solid white;
            opacity: 0.7;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 15px;
        }

        .social-icons a {
            text-decoration: none;
        }

        .icon-circle {
            width: 45px;
            height: 45px;
            background-color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .icon-circle:hover {
            transform: scale(1.2);
            background-color: #FFCF40;
        }

        .icon-circle i {
            color: #027AA8;
            font-size: 20px;
            transition: color 0.3s ease;
        }

        .icon-circle:hover i {
            color: white;
        }

        @media (max-width: 768px) {
            .social-icons {
                flex-wrap: wrap;
                gap: 10px;
            }

            .icon-circle {
                width: 40px;
                height: 40px;
            }

            .middle p, .middle a {
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            .footer-content {
                width: 95%;
            }

            .footer-line {
                width: 90%;
            }
        }
    </style>
</head>
<body class="page-container">
    <nav>
        <div class="wrapper">
            <div class="logo">
                <a href="#">
                    <img
                        src="${pageContext.request.contextPath}/images/UPES University of Petroleum and Energy Studies.png"
                        alt="Logo"
                    />
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
                    <ul class="dropdown-list" id="club-dropdown-list">
                    </ul>
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

    <div class="content-wrap">
        <!-- THIS IS THE TAGS SECTION -->
        <div class="event-filters">
            <input type="text" id="search-bar" placeholder="Search events..." oninput="filterEvents()" />
            <select id="keyword-filter" onchange="filterEvents()">
                <option value="">Select Tag</option>
                <option value="Coding">Coding</option>
                <option value="Dance">Dance</option>
                <option value="Art">Art</option>
                <option value="Competition">Competition</option>
                <option value="Innovation">Innovation</option>
                <option value="Bootcamp">Bootcamp</option>
                <option value="Beginner">Beginner</option>
                <option value="AI">AI</option>
                <option value="Workshop">Workshop</option>
                <option value="Cybersecurity">Cybersecurity</option>
                <option value="Talk">Talk</option>
                <option value="Meeting">Meeting</option>
                <option value="Annual">Annual</option>
                <option value="Hackathon">Hackathon</option>
                <option value="Networking">Networking</option>
                <option value="Exhibition">Exhibition</option>
                <option value="Photography">Photography</option>
                <option value="Seminar">Seminar</option>
                <option value="Public Speaking">Public Speaking</option>
                <option value="Music">Music</option>
                <option value="Festival">Festival</option>
                <option value="Food">Food</option>
                <option value="Fitness">Fitness</option>
            </select>
            
            <select id="sort-filter" onchange="sortEvents()">
                <option value="">Sort By</option>
                <option value="a-z">A-Z</option>
                <option value="z-a">Z-A</option>
                <option value="newest">Newest</option>
                <option value="oldest">Oldest</option>
            </select>
            
        </div>
        <div class="event-section">
            <h2>Welcome, to the Events Page</h2>
            <div id="event-container" class="event-container">
                <!-- Event Cards will be dynamically inserted here -->
            </div>
        </div>
    </div>

    <footer class="footer">
        <div class="footer-content">
            <div class="middle">
                <p>Made in Response to Minor Project 1</p>
                <a href="https://github.com/your-repo-link" target="_blank">Click to View GitHub Repository</a>
            </div>
            <hr class="footer-line">
            <div class="social-icons">
                <a href="https://www.instagram.com/upes_dehradun/" target="_blank" class="icon-circle">
                    <i class="fa-brands fa-instagram"></i>
                </a>
                <a href="https://www.facebook.com/UPESddnuk" target="_blank" class="icon-circle">
                    <i class="fa-brands fa-facebook-f"></i>
                </a>
                <a href="https://www.youtube.com/user/UPESUniversity/featured" target="_blank" class="icon-circle">
                    <i class="fa-brands fa-youtube"></i>
                </a>
                <a href="https://www.linkedin.com/school/upesdehradun/posts/?feedView=all" target="_blank" class="icon-circle">
                    <i class="fa-brands fa-linkedin-in"></i>
                </a>
                <a href="https://www.upes.ac.in/" target="_blank" class="icon-circle">
                    <i class="fa-solid fa-link"></i>
                </a>
            </div>
        </div>
    </footer>
    <script>
        // Fetch and render events from backend
        function fetchEvents() {
            fetch('http://localhost:8080/api/events')  // Ensure this matches your backend endpoint
            .then(response => response.json())
            .then(events => {
                console.log('Fetched events:', events); // Log the events array to the console
                const container = document.getElementById('event-container');
                container.innerHTML = ''; // Clear existing events
    
                if (Array.isArray(events) && events.length > 0) {
                    events.forEach(event => {
                        const eventCard = document.createElement('div');
                        eventCard.classList.add('event-card');
                        eventCard.dataset.startDate = event.startDate; // Store the event date for sorting
    
                        eventCard.innerHTML = `
                            <div class="event-card-header">
                                <img src="${event.clubLogoUrl}" alt="${event.clubName} Logo" class="event-logo">
                                <h3>${event.eventName}</h3>
                            </div>
                            <img src="${event.eventImageUrl}" alt="${event.eventName}" class="event-image">
                            <div class="event-details">
                                <p class="event-description">${event.description}</p>
                                <button class="read-more-btn" onclick="openEventDetails(${event.id})">Read More</button>
                            </div>
                        `;
                        container.appendChild(eventCard);
                    });
                } else {
                    console.log('No events found or incorrect data structure.');
                }
            })
            .catch(error => {
                console.error('Error fetching events:', error);
            });
        }
    
        // Call fetchEvents when the page loads
        document.addEventListener('DOMContentLoaded', fetchEvents);
    
        // Function to filter events based on user input
        function filterEvents() {
            const searchValue = document.getElementById("search-bar").value.toLowerCase();
            const keywordValue = document.getElementById("keyword-filter").value.toLowerCase();
    
            const events = document.querySelectorAll(".event-card");
    
            events.forEach((event) => {
                const description = event.querySelector(".event-description").textContent.toLowerCase();
    
                const matchesSearch = description.includes(searchValue);
                const matchesKeyword = keywordValue === "" || description.includes(keywordValue);
    
                if (matchesSearch && matchesKeyword) {
                    event.style.display = "flex";
                } else {
                    event.style.display = "none";
                }
            });
        }
    
        // Function to sort events based on the selected option
    // Function to sort events based on the selected option
function sortEvents() {
    const sortValue = document.getElementById("sort-filter").value;
    const container = document.querySelector(".event-container");
    const events = Array.from(container.children);

    events.sort((a, b) => {
        let comparison = 0;

        if (sortValue === "a-z") {
            // Sort alphabetically (A-Z)
            const textA = a.querySelector(".event-details h3").textContent.trim().toLowerCase();
            const textB = b.querySelector(".event-details h3").textContent.trim().toLowerCase();
            if (textA < textB) comparison = -1;
            if (textA > textB) comparison = 1;
        } else if (sortValue === "z-a") {
            // Sort alphabetically (Z-A)
            const textA = a.querySelector(".event-details h3").textContent.trim().toLowerCase();
            const textB = b.querySelector(".event-details h3").textContent.trim().toLowerCase();
            if (textA > textB) comparison = -1;
            if (textA < textB) comparison = 1;
        } else if (sortValue === "newest") {
            // Sort by newest (based on the event start date)
            const dateA = new Date(a.dataset.startDate);
            const dateB = new Date(b.dataset.startDate);
            comparison = dateB - dateA; // Newest first
        } else if (sortValue === "oldest") {
            // Sort by oldest (based on the event start date)
            const dateA = new Date(a.dataset.startDate);
            const dateB = new Date(b.dataset.startDate);
            comparison = dateA - dateB; // Oldest first
        }

        return comparison;
    });

    // Clear the container and re-append the sorted events
    events.forEach(event => container.appendChild(event));
}

    
        // Function to open event details (to be implemented)
        function openEventDetails(eventId) {
            // Implement event details popup or redirect
            console.log('Opening details for event:', eventId);
        }
    
        // Attach the filter and sort events functions to input and select elements
        document.getElementById("search-bar").addEventListener("input", filterEvents);
        document.getElementById("keyword-filter").addEventListener("input", filterEvents);
        document.getElementById("sort-filter").addEventListener("change", sortEvents);
    </script>
               
</body>
</html>