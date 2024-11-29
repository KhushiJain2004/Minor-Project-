<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Club Dashboard</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
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
            font-family: 'Poppins', sans-serif;
        }
        footer {
            background-color: #027AA8;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        nav {
        position: absolute; 
        top: 0; 
        left: 0; 
        width: 100%; 
        background-color: #e9f2f9; 
        z-index: 1000; 
      }

      nav .wrapper {
        position: relative;
        max-width: 2000px;
        padding: 0px 30px;
        height: 70px;
        line-height: 70px;
        background-color: #fff;
        margin: auto;
        display: flex;
        align-items: center;
        justify-content: space-between;
      }

      /* Logo styling */
      .wrapper .logo {
        display: flex; 
        align-items: center; 
        justify-content: center; 
        padding: 50px; 
      }

      .logo a:hover img {
        transform: scale(1.05); 
      }

      /* Responsive adjustments */
      @media screen and (max-width: 970px) {
        .logo img {
          height: 80px;
          width: 40px; 
        }
      }

      @media screen and (max-width: 600px) {
        .logo img {
          height: 80px;
          width: 40px; 
        }
      }

      /* Nav links styling */
      .wrapper .nav-links {
        display: inline-flex;
      }

      .nav-links li {
        list-style: none;
      }

      .nav-links li a {
        color: #027aa8;
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

      /* Mobile nav toggle button */
      .wrapper .btn {
        color: #fff;
        font-size: 20px;
        cursor: pointer;
        display: none;
      }

      .wrapper .btn.close-btn {
        position: absolute;
        right: 30px;
        top: 10px;
      }

      /* Mobile view styles */
      @media screen and (max-width: 970px) {
        .wrapper .btn {
          display: block;
        }

        ::-webkit-scrollbar {
          width: 10px;
        }
        ::-webkit-scrollbar-track {
          background: #027aa8;
        }
        ::-webkit-scrollbar-thumb {
          background: #027aa8;
        }
        #menu-btn:checked ~ .nav-links {
          left: 0%;
        }
        #menu-btn:checked ~ .btn.menu-btn {
          display: none;
        }
        #close-btn:checked ~ .btn.menu-btn {
          display: block;
        }
        .nav-links li {
          margin: 15px 10px;
        }
        .nav-links li a {
          padding: 0 20px;
          display: block;
          font-size: 20px;
        }
        .nav-links .drop-menu {
          position: static;
          opacity: 1;
          top: 65px;
          visibility: visible;
          padding-left: 20px;
          width: 100%;
          max-height: 0px;
          overflow: hidden;
          box-shadow: none;
          transition: all 0.3s ease;
        }

         .drop-menu li {
          margin: 0;
        }
        .drop-menu li a {
          border-radius: 5px;
          font-size: 18px;
        }
      }

      /* Nav input styling */
      nav input {
        display: none;
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
        .event-card {
            width: 30%; 
            height: 300px;
            position: relative;
            color: white;
            border-radius: 10px;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            padding: 20px;
            overflow: hidden;
            box-sizing: border-box;
        }
        .event-card:hover {
            transform: scale(1.05);
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
        }
        .event-logo img {
            width: 100%;
            height: 100%;
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
        align-items: center;
        margin: 20px auto;
        max-width: 80%;
        background-color: rgba(255, 255, 255, 0.8);
        padding: 10px;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .event-filters input, .event-filters select {
        padding: 10px;
        font-size: 16px;
        margin-right: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .event-card {
                width: 100%; 
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
    </style>
</head>
<body>
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
          <input type="radio" name="slider" id="menu-btn" />
          <input type="radio" name="slider" id="close-btn" />
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
            <!-- <li><a href="clubAdminDash.jsp">Feedback</a></li> -->
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
    <div class="event-filters">
        <input 
            type="text" 
            id="search-bar" 
            placeholder="Search events..." 
            oninput="filterEvents()" 
        />
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
        <div class="event-card" style="background-image: url('event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 1"></div>
            <div class="event-description">CLUB NAME <br>Ongoing Event 1 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button>
        </div>
        <div class="event-card" style="background-image: url('event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 2"></div>
            <div class="event-description">CLUB NAME <br>Ongoing Event 2 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button>
        </div>
        <div class="event-card" style="background-image: url('event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 3"></div>
            <div class="event-description">CLUB NAME <br>Ongoing Event 3 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button>
        </div>
    </div>
    <h2>Upcoming Events</h2>
    <div class="event-container">
        <div class="event-card" style="background-image: url('event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 4"></div>
            <div class="event-description">CLUB NAME <br>Upcoming Event 1 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button> 
        </div>
        <div class="event-card" style="background-image: url('event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 5"></div>
            <div class="event-description">CLUB NAME <br>Upcoming Event 2 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button>
        </div>
        <div class="event-card" style="background-image: url('event.jpg');">
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

    <footer></footer>

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
