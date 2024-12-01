<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Club Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600&display=swap" rel="stylesheet">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/js/events.js"></script>
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
    crossorigin="anonymous"
    referrerpolicy="no-referrer"
  />
  <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
    <style>
        body {
            background-color: #E2F3FB;
            margin: 0;
            font-family: 'Quicksand', sans-serif;
        }
        header, footer {
            background-color: #027AA8;
            height: 60px;
            display: flex;
            align-items: right;
            justify-content: center;
        }

        .container {
            position: relative;
            text-align: center;
            padding: 20px;
            max-width: 80%;
            margin: 40px auto;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
        }
        .bg-image {
            background-image: url('bg.jpg'); 
            background-size: cover;
            background-position: center center;
            min-height: 375px; 
            filter: blur(2px);
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1;
        }

        .content {
            position: relative;
            z-index: 2;
            color: white;
        }
        .logo {
            width: 60px;
            position: absolute;
            top: 20px;
            left: 20px;
            z-index: 3; 
        }
        
        h1 {
            font-size: 36px;
            margin: 20px 0;
            font-weight: bold;
        }
        .bio {
            font-size: 16px;
            text-align: justify;
            margin: 10px 20px;
        }
        .keywords {
            font-size: 20px;
            margin: 15px 0;
        }
        .members {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .member {
            margin: 0 10px;
            text-align: center;
        }
        .member img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 2px solid white;
        }
        .member-name {
            font-size: 18px;
            margin-top: 5px;
        }
        .member-designation {
            font-size: 14px;
            color: #fff;
        }
        
        .event-section {
            max-width: 80%;
            margin: 40px auto;
            padding: 20px;
        }
        .event-section h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #027AA8;
        }

        .event-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 20px; /* Add some spacing between cards */
    max-width: 80%;
    margin: 40px auto;
}

.event-card {
    flex: 1 1 calc(25% - 20px); /* Adjust width to fit 4 cards per row with gaps */
    display: flex; 
    flex-direction: column;
    background-color: rgba(255, 255, 255, 0.8); 
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
}

.event-card img {
    width: 100%;
    height: 150px; /* Adjust height as needed */
    object-fit: cover;
}

.event-details {
    padding: 15px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.event-description {
    font-size: 16px;
    color: #333;
    margin-bottom: 10px;
}

.read-more-btn {
    align-self: flex-start;
    background-color: #027AA8;
    color: white;
    padding: 5px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 10px;
}

.read-more-btn:hover {
    background-color: #005f7f;
}

/* Responsive design for smaller screens */
@media (max-width: 1024px) {
    .event-card {
        flex: 1 1 calc(33.33% - 20px); /* 3 cards per row on medium screens */

        
        .event-container {
    display: flex;
    flex-wrap: wrap; /* Allow wrapping of elements */
    justify-content: space-between; /* Add space between rows */
    gap: 20px; /* Space between cards */
}

.event-card {
    flex: 1 1 calc(25% - 20px); /* Each card takes up 25% width minus the gap */
    max-width: calc(25% - 20px); /* Ensure max width matches */
    min-width: 250px; /* Optional: Minimum width for a card */
    height: 300px; /* Fixed height for uniformity */
    position: relative;
    color: white;
    border-radius: 10px;
    transition: transform 0.3s ease;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    padding: 20px;
    overflow: hidden;
    box-sizing: border-box;
}

.event-card:hover {
    transform: scale(1.05); /* Slightly increase size on hover */
}

@media (max-width: 1200px) {
    .event-card {
        flex: 1 1 calc(33.33% - 20px); /* Three cards per row */
    }
}

@media (max-width: 992px) {
    .event-card {
        flex: 1 1 calc(50% - 20px); /* Two cards per row */

    }
}

@media (max-width: 768px) {
    .event-card {
        flex: 1 1 calc(50% - 20px); /* 2 cards per row on small screens */
    }
}

@media (max-width: 480px) {
    .event-card {
        flex: 1 1 100%; /* 1 card per row on extra-small screens */
    }
}

        .event-card:hover {
            transform: scale(1.05);
        }

        flex: 1 1 100%; /* Single card per row on small screens */
    }
}

        

        .event-card::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-size: cover;
            background-position: center;
            background-image: inherit; 
            filter: blur(2px); 
            z-index: 1; 
        }
        .event-card > * {
            position: relative;
            z-index: 2; 
        }
        .event-logo {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: white;
            margin-bottom: 10px;
            background-image: url('images/club-logo.png');
            background-size: cover;
            background-position: center;

        }
        .event-logo img {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 50%;
        }
        .event-description {
            font-size: 14px;
            margin-bottom: 10px;
        }
        .read-more-btn {
            background-color: #027AA8;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .read-more-btn:hover {
            background-color: #005f7f;
        }
        .event-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
        }
        
        .event-filters {
    display: flex;
    justify-content: space-between;
    align-items: center; /* Ensure vertical alignment */
    margin: 20px auto;
    max-width: 60%;
    background-color: rgba(255, 255, 255, 0.8);
    padding: 10px;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

/* Group dropdowns on the left */
.event-filters select {
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
    margin-right: 10px; /* Space between dropdowns */
}

/* Style the search bar and increase its length */
.event-filters input[type="text"] {
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none; /* Push the search bar to the right */
    width: 80%; /* Set the width of the search bar */
    max-width: 600px; /* Optional: Limit the maximum width */
}

/* Ensure all elements wrap properly on smaller screens */
@media (max-width: 768px) {
    .event-filters {
        flex-wrap: wrap;
        justify-content: center; /* Center items for smaller screens */
    }

    .event-filters select,
    .event-filters input[type="text"] {
        width: 100%; /* Stack elements vertically and make them full width */
        margin: 5px 0; /* Add spacing between elements */
    }
}

.hidden {
    display: none;
}


        .popup-content {
            background-color: white;
            border-radius: 10px;
            width: 33%; 
            max-width: 600px; 
            padding: 20px;
            position: relative; 
            max-height: 80%; 
            overflow-y: scroll; 
            scrollbar-width: none; 
        }

        .popup-content::-webkit-scrollbar {
            display: none; 
        }

        .popup {
            display: none; 
            position: fixed; 
            z-index: 1000; 
            left: 0;
            top: 0;
            width: 100%; 
            height: 100%; 
            background-color: rgba(0, 0, 0, 0.5); 
            justify-content: center; 
            align-items: center; 
            overflow: hidden; 
        }

        .close-btn {
            position: absolute;
            top: 3px;
            right: 15px;
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: #333;
        }
        .close-btn:hover {
            color: #027AA8;
        }
        .popup-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
        .popup-logo img {
            width: 50px; 
            height: 50px;
            border-radius: 50%;
        }
        .register-btn {
            background-color: #027AA8;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .register-btn:hover {
            background-color: #005f7f;
        }
        .popup-image img {
            width: 100%;
            border-radius: 10px;
            margin-bottom: 15px;
        }
        .popup-info h3 {
            margin: 10px 0;
            color: #027AA8;
        }


        .footer {
            background-color: #027AA8; /* Dark background for contrast */
            color: white; /* White text color */
            padding: 20px;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .footer-content {
            width: 90%;
            max-width: 1200px;
            text-align: center;
        }

        .top-left {
            text-align: left;
            width: 100%;
        }

        .top-left h3 {
            margin: 0;
            color: white;
        }

        .middle p {
            margin: 5px 0;
            color: white;
            font-size: 16px;
        }

        .middle a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            margin: 10px 0;
            display: inline-block;
        }

        .middle a:hover {
            text-decoration: underline;
        }

        .footer-line {
            width: 80%;
            margin: 15px auto;
            border: 0.5px solid white;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 10px;
        }

        .social-icons a{
            text-decoration: none;
        }

        .icon-circle {
            width: 40px;
            height: 40px;
            background-color: white; /* White circles */
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .icon-circle:hover {
            transform: scale(1.1);
        }

        .icon-circle i {
            color: #027AA8; /* Icon color */
            font-size: 20px;
        }

        nav {
  width: 150%;
  height: 80px;
  background: #fff;
  display: flex;
  align-items: center;
  justify-content: space-between;
  position: fixed;
  top: 0;
  left: 0px;
  z-index: 1500;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.wrapper {
  width: 100%;
  max-width: 1200px;
  margin-left: 80%;
  padding: 0 20px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.logo img {
  max-width: 120px; /* Increase logo size */
  height: auto; /* Maintain aspect ratio */
  padding-top: 10px; /* Adjust vertical alignment */
  transition: transform 0.3s ease;
}

.logo a:hover img {
  transform: scale(1.05);
}

.nav-links {
  display: inline-flex;
}

.nav-links li {
  list-style: none;
}

.nav-links li a {
  color: #027AA8;
  text-decoration: none;
  font-size: 18px;
  font-weight: 500;
  padding: 9px 15px;
  border-radius: 5px;
  transition: all 0.3s ease;
}

.nav-links li a:hover {
  background: #96badf;
}

#club-dropdown {
  position: relative;
}

#club-dropdown:hover .dropdown-list {
  display: block;
}

.dropdown-list {
  position: absolute;
  top: 100%;
  left: 0;
  background: #fff;
  list-style: none;
  padding: 0;
  margin: 0;
  border: 1px solid #ddd;
  display: none;
  z-index: 1000;
}

.dropdown-list li a {
  padding: 10px 15px;
  color: #333;
  display: block;
  text-decoration: none;
  white-space: nowrap;
}

.dropdown-list li a:hover {
  background: #f5f5f5;
}

@media screen and (max-width: 768px) {
  .nav-links {
    display: none;
    flex-direction: column;
    position: left;
    background: #fff;
    width: 100%;
    position: fixed;
    top: 80px;
    left: 0;
    padding: 10px;
    border-top: 1px solid #ddd;
  }

  .nav-links li {
    margin: 10px 0;
  }

  .menu-btn {
    display: block;
    color: #027AA8;
    cursor: pointer;
  }

  .menu-btn .fas {
    font-size: 28px;
  }

  input#menu-btn:checked ~ .nav-links {
    display: flex;
  }

  input#close-btn:checked ~ .nav-links {
    display: none;
  }

  .btn {
    display: block;
  }
}

    </style>
</head>
<body>
    <header>
      <nav>
        <div class="wrapper">
          <div class="logo">
            <a href="#">
              <img src="images/UPES University of Petroleum and Energy Studies.png" alt="Logo" />
            </a>
          </div>
          <ul class="nav-links">
            <label for="close-btn" class="btn close-btn">
              <i class="fas fa-times"></i>
            </label>
            <li><a href="#">Home</a></li>
            <li><a href="/event">Events</a></li>
            <li id="club-dropdown">
              <a href="#">Clubs</a>
              <ul class="dropdown-list" id="club-dropdown-list">
                <!-- Club names will be dynamically inserted here -->
                 <!-- <li>sample</li>
                 <li>sample</li>
                 <li>sample</li> -->
              </ul>
            </li>
            <li id="login-link"><a href="/login">Login</a></li>
            <li id="profile-item" style="display: none;">
              <a href="#" id="logoutLink">Logout</a>
              <img src="images/profile.png" alt="Profile" class="profile-icon" />
              <span id="username"></span> 
            </li>
          </ul>
          <label for="menu-btn" class="btn menu-btn">
            <i class="fas fa-bars"></i>
          </label>
        </div>
      </nav>
    </header>
    <div class="event-filters">
        <input type="text" id="search-bar" placeholder="Search events..." oninput="filterEvents()" />
        <select id="keyword-filter" onchange="filterEvents()">
            <option value="">All Keywords</option>
            <option value="Keyword1">Keyword1</option>
            <option value="Keyword2">Keyword2</option>
            <option value="Keyword3">Keyword3</option>
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
    <h2>Ongoing Events</h2>
    <div class="event-container">

        <!-- Events will be rendered dynamically here -->

        <div class="event-card" style="background-image: url('images/event.jpg');">
            <div class="event-logo" style="background-image: url('images/club-logo.png')"></div>
            <div class="event-description">CLUB NAME <br>Ongoing Event 1 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button>
        </div>
        <div class="event-card" style="background-image: url('images/event.jpg');">
            <div class="event-logo"style="background-image: url('images/club-logo.png') alt="Event Logo 2"></div>
            <div class="event-description">CLUB NAME <br>Ongoing Event 2 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button>
        </div>
        <div class="event-card" style="background-image: url('images/event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 3"></div>
            <div class="event-description">CLUB NAME <br>Ongoing Event 3 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button>
        </div>
    </div>
    <h2>Upcoming Events</h2>
    <div class="event-container">
        <div class="event-card" style="background-image: url('images/event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 4"></div>
            <div class="event-description">CLUB NAME <br>Upcoming Event 1 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button> 
        </div>
        <div class="event-card" style="background-image: url('images/event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 5"></div>
            <div class="event-description">CLUB NAME <br>Upcoming Event 2 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button>
        </div>
        <div class="event-card" style="background-image: url('images/event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 6"></div>
            <div class="event-description">CLUB NAME <br>Upcoming Event 3 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button> 
        </div>
        <div class="event-card" style="background-image: url('images/event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 6"></div>
            <div class="event-description">CLUB NAME <br>Upcoming Event 3 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button> 
        </div>

    </div>
</div>

    <!-- Popup -->
    <div id="event-popup" class="hidden popup">
        <div class="popup-content">
            <button id="close-popup" class="close-btn">&times;</button>
            <div class="popup-header">
                <div class="popup-logo">
                    <img src="event_logo.png" alt="Event Logo">
                </div>
                <button class="register-btn">Register</button>
            </div>
            <div class="popup-image">
                <img src="event.jpg" alt="Event Image">
            </div>
            <div class="popup-info">
                <h3>Event Name</h3>
                <h4>Club Name</h4>
                <p>Here is the detailed description of the event. This section will contain all the deep information about the event such as its schedule, speakers, venue, and more. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Blanditiis, ab officia at, aspernatur id optio expedita minus cupiditate fugiat dolorem velit incidunt! Nulla nihil architecto temporibus similique ullam neque non.</p>
            </div>
        </div>
    </div>

    <footer class="footer">
        <div class="footer-content">
            <div class="middle">
                <p>Made in Response to Minor Project 1</p>
                <a href="https://github.com/your-repo-link" target="_blank">Click to View GitHub Repository</a>
            </div>
            <hr class="footer-line" />
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
        function openPopup() {
            document.getElementById("event-popup").style.display = "flex"; 
        }

        document.getElementById("close-popup").onclick = function() {
            document.getElementById("event-popup").style.display = "none"; 
        }

    // Search and filter function
    function filterEvents() {
        const searchValue = document.getElementById("search-bar").value.toLowerCase();
        const keywordValue = document.getElementById("keyword-filter").value.toLowerCase();

        const events = document.querySelectorAll(".event-card");

        events.forEach((event) => {
            const description = event.querySelector(".event-description").textContent.toLowerCase();

            // Check if the event matches the search and keyword filters
            const matchesSearch = description.includes(searchValue);
            const matchesKeyword = keywordValue === "" || description.includes(keywordValue);

            if (matchesSearch && matchesKeyword) {
                event.style.display = "flex"; // Show matching events
            } else {
                event.style.display = "none"; // Hide non-matching events
            }
        });
    }

    // Sort function
    function sortEvents() {
        const sortValue = document.getElementById("sort-filter").value;
        const container = document.querySelector(".event-container");

        const events = Array.from(container.children);

        events.sort((a, b) => {
            const textA = a.querySelector(".event-description").textContent.trim();
            const textB = b.querySelector(".event-description").textContent.trim();

            if (sortValue === "a-z") {
                return textA.localeCompare(textB);
            } else if (sortValue === "z-a") {
                return textB.localeCompare(textA);
            } else if (sortValue === "newest") {
                // Assuming newest events are displayed at the end of the list initially
                return container.children.length - events.indexOf(b);
            } else if (sortValue === "oldest") {
                return events.indexOf(a) - events.indexOf(b);
            }
            return 0;
        });

        // Reorganize sorted elements back into the container
        events.forEach((event) => container.appendChild(event));
    }
    </script>

</body>
</html>