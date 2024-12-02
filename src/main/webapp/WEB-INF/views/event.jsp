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
    <script src="${pageContext.request.contextPath}/js/nav.js"></script>
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
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f9;
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

        nav .logo img {
            height: 140px;
            width: auto;
        }

        .nav-links {
            display: flex;
            justify-content: flex-end;
            gap: 20px;
            padding: 15px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            padding: 5px 10px;
            transition: background-color 0.3s ease;
        }

        .nav-links a:hover {
            background-color: #005F7F;
            border-radius: 5px;
        }

        /* Event Filters */
        .event-filters {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            justify-content: center;
            padding: 20px 0;
        }

        .event-filters input,
        .event-filters select {
            padding: 10px;
            border: 2px solid #027AA8;
            border-radius: 5px;
            min-width: 180px;
            font-size: 14px;
            background-color: #fff;
            transition: border-color 0.3s;
        }

        .event-filters input:focus,
        .event-filters select:focus {
            border-color: #005F7F;
        }

        /* Event Section */
        .event-section {
            max-width: 90%;
            margin: 40px auto;
        }

        .event-section h2 {
            font-size: 32px;
            margin-bottom: 30px;
            color: #027AA8;
            text-align: center;
        }

        .event-container {
    display: grid;
    grid-template-columns: repeat(5, 1fr); /* 5 equal-width columns */
    gap: 30px; /* Increase the gap between cards */
    margin-bottom: 40px;
}

.event-card {
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.3s, box-shadow 0.3s;
    display: flex;
    flex-direction: column;
    height: 400px; /* Increase the height of the card */
}

.event-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
}

.event-card-header {
    display: flex;
    align-items: center;
    padding: 20px; /* Increase padding for header */
    background-color: #f4f4f4;
}

.event-logo {
    width: 60px; /* Increase the size of the logo */
    height: 60px;
    border-radius: 50%;
    object-fit: cover;
    margin-right: 20px; /* Increase spacing between logo and title */
    border: 2px solid #027AA8;
}

.event-card img.event-image {
    width: 100%;
    height: 250px; /* Increase the height of the event image */
    object-fit: cover;
}

.event-details {
    padding: 20px; /* Increase padding for details section */
    flex-grow: 1;
}

.event-details h3 {
    font-size: 24px; /* Increase font size for event title */
    color: #027AA8;
    margin-bottom: 15px;
}

.event-description {
    font-size: 16px; /* Increase font size for description */
    color: #555;
    margin-bottom: 20px;
    flex-grow: 1;
}

.read-more-btn {
    background-color: #027AA8;
    color: white;
    border: none;
    padding: 15px 20px; /* Increase button padding */
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.read-more-btn:hover {
    background-color: #005F7F;
}


        /* Footer Styles */
        .footer {
            background-color: #027AA8;
            color: white;
            padding: 50px 0;
            text-align: center;
        }

        .footer-content {
            width: 90%;
            margin: 0 auto;
        }

        .footer-line {
            margin: 20px auto;
            width: 60%;
            height: 1px;
            background-color: white;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 15px;
        }

        .social-icons a {
            text-decoration: none;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 40px;
            height: 40px;
            background-color: white;
            border-radius: 50%;
            transition: background-color 0.3s;
        }

        .social-icons a:hover {
            background-color: #FFCF40;
        }

        .social-icons i {
            color: #027AA8;
            font-size: 20px;
            transition: color 0.3s;
        }

        .social-icons a:hover i {
            color: white;
        }

        @media (max-width: 768px) {
            .nav-links {
                flex-direction: column;
                gap: 10px;
                padding: 20px;
            }

            .footer-content {
                width: 100%;
            }

            .social-icons {
                flex-wrap: wrap;
                gap: 10px;
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
                    <span id="username" style="color: black;"></span>
                </li>
            </ul>
        </div>
    </nav>

    <div class="content-wrap">
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
                <option value="Management">Management</option>
            </select>
        </div>

        <section class="event-section">
            <h2>Events</h2>
            <div class="event-container">
                <!-- Dynamic event cards will be inserted here -->
            </div>
        </section>
    </div>

    <footer class="footer">
        <div class="footer-content">
            <p>© 2024 UPES Clubs Portal</p>
            <div class="footer-line"></div>
            <div class="social-icons">
                <a href="#" target="_blank"><i class="fa-brands fa-facebook-f"></i></a>
                <a href="#" target="_blank"><i class="fa-brands fa-twitter"></i></a>
                <a href="#" target="_blank"><i class="fa-brands fa-linkedin-in"></i></a>
                <a href="#" target="_blank"><i class="fa-brands fa-instagram"></i></a>
            </div>
        </div>
    </footer>
    <script>

// Render events dynamically
function renderEvents(filteredEvents) {
    const eventContainer = document.querySelector('.event-container');
    eventContainer.innerHTML = '';  // Clear existing events

    filteredEvents.forEach(event => {
        const eventCard = document.createElement('div');
        eventCard.classList.add('event-card');

        eventCard.innerHTML = `
            <div class="event-card-header">
                <img src="${event.logo}" alt="${event.title}" class="event-logo" />
                <div>
                    <h3>${event.title}</h3>
                </div>
            </div>
            <img src="${event.image}" alt="${event.title}" class="event-image" />
            <div class="event-details">
                <p class="event-description">${event.description}</p>
                <button class="read-more-btn" onclick="window.location.href='/event/${event.id}'">Read More</button>
            </div>
        `;
        
        eventContainer.appendChild(eventCard);
    });
}

// Filter events based on search input and selected tag
function filterEvents() {
    const searchQuery = document.getElementById('search-bar').value.toLowerCase();
    const tagFilter = document.getElementById('keyword-filter').value;

    const filteredEvents = events.filter(event => {
        const matchesSearch = event.title.toLowerCase().includes(searchQuery) || event.description.toLowerCase().includes(searchQuery);
        const matchesTag = tagFilter ? event.tag === tagFilter : true;
        return matchesSearch && matchesTag;
    });

    renderEvents(filteredEvents);
}

// Initial render
renderEvents(events);

// Add event listeners
document.getElementById('search-bar').addEventListener('input', filterEvents);
document.getElementById('keyword-filter').addEventListener('change', filterEvents);

$("#logoutLink").on("click", function (e) {
        e.preventDefault(); // Prevent the default link behavior
        logout();
      });

    </script>
</body>
</html>
