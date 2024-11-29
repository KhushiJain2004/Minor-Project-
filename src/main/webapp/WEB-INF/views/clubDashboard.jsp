<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Club Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/js/nav.js"></script>
    <script src="${pageContext.request.contextPath}/js/clubProfile.js"></script>
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
    crossorigin="anonymous"
    referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            background-color: #E2F3FB;
            margin: 0;
            font-family: 'Quicksand', sans-serif;
        }
        header, footer {
            background-color: #027AA8;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .main-container {
            display: flex;
            align-items: center;
            justify-content: flex-start; 
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .content {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            margin-left: 200px;
        }

        .club-name {
            font-size: 36px;
            font-weight: bold;
            color: #000;
        }

        .slogan {
            font-size: 20px;
            color: #000;
        }

        .club-image img {
            width: 400px; 
            height: 400px; 
            display: block;
            object-fit: cover; 
            padding-right: 0; 
            margin-right: 0; 
            margin-top: 20px;
            margin-bottom: 80px;
            margin-left: 200px;
        }


        .logo {
            display: block; 
            margin: 0 auto 10px; 
            width: 100px; 
            height: 100px;
            border-radius: 50%;
        }

        p, h1, .bio {
            margin: 10px 0; 
        }

        h1{
            color: #027AA8;
        }

        .content h2{
            text-align: left;
            color: #027AA8;
        }

        h2{
            text-align: center;
            color: #027AA8;
        }

        .about{
            margin-top: 80px; 
            position: relative;
            z-index: 2;
            text-align: justify;
            color: black;
            max-width: 900px;
            margin: auto;
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
            color: #000;
        }

        .club-achievements, 
        .membership-benefits {
            position: relative; 
            z-index: 2;
            margin: 20px auto;
            max-width: 900px; 
            padding: 10px;
            margin-top: 10px;
        }

        .club-achievements h2,
        .membership-benefits h2 {
            font-size: 1.8rem;
            color: #027AA8;
            margin: 20px 0 10px;
        }

        .club-achievements p{
            font-size: 1rem;
            color: #000;
            line-height: 1.6;
            margin-bottom: 20px;
            margin: 10px 0;
        }

        .membership-benefits {
            text-align: center;
            margin-top: 0;
        }

        .benefit-container {
            display: flex;
            justify-content: space-around;
            align-items: center;
            margin-top: 20px;
        }

        .benefit-item {
            background-color: white;
            color: black;
            border-radius: 50%;
            width: 180px;
            height: 180px;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            padding: 10px;
        }

        .benefit-item p {
            margin: 0; 
        }

        .member-button-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 30px;
        }

        .member-button {
            background-color: #027AA8;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .member-button:hover {
            background-color: #005f7f;
        }
        
        .event-section {
            max-width: 80%;
            margin: 40px auto;
            padding: 20px;
            margin-top: 20px;
        }
        .event-section h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #027AA8;
        }

        .event-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            justify-items: center;
        }

        .event-card {
            width: 100%; 
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
            background-color: rgba(0, 0, 0, 0.5); 
            color: white; 
            padding: 10px; 
            border-radius: 5px; 
            font-size: 16px; 
            max-width: 100%; 
            margin-bottom: 5px;
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
        
        /* Responsive design */
        @media (max-width: 768px) {
            .event-container {
                grid-template-columns: 1fr; 
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

        /* Social Media Section */
        .social-media {
            position: fixed;
            top: 50%;
            right: 10px; 
            transform: translateY(-50%);
            z-index: 1000;
        }

        .social-media ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .social-media ul li {
            margin-bottom: 15px;
        }

        .social-media ul li a {
            display: block;
            font-size: 36px; 
            color: #027AA8; 
            text-decoration: none;
            transition: color 0.3s;
        }

        .social-media ul li a:hover {
            color: #005f7f; 
        }

        /* Optional: For spacing around icons */
        .social-media ul li i {
            transition: transform 0.3s ease;
        }

        .social-media ul li a:hover i {
            transform: scale(1.2); 
        }
    </style>
</head>
<body>
    <header>
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
</header>

    <div class="main-container">
        <div class="content">
            <img src="logo.jpeg" alt="Club Logo" class="logo">
            <p class="slogan">Your Slogan Here</p>
            <h1 class="club-name">Club Name</h1>
        </div>
        <div class="club-image">
            <img src="bg.jpg" alt="Club Image">
        </div>        
    </div>

    <div class="about">
        <h2>About Us</h2>
        <p class="bio" id="description">This is a short bio or about the club. It should provide a brief overview of the club's mission, activities, and values. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nulla ullam optio sed! Exercitationem vero, enim dolores pariatur quaerat vel suscipit, officia debitis, ratione facere molestias cupiditate rem repellendus? Accusamus, blanditiis.</p>
        <div class="members">
            <div class="member">
                <img src="pic.png" alt="Member 1">
                <div class="member-name">Member Name 1</div>
                <div class="member-designation">Designation 1</div>
            </div>
            <div class="member">
                <img src="pic.png" alt="Member 2">
                <div class="member-name">Member Name 2</div>
                <div class="member-designation">Designation 2</div>
            </div>
            <div class="member">
                <img src="pic.png" alt="Member 3">
                <div class="member-name">Member Name 3</div>
                <div class="member-designation">Designation 3</div>
            </div>
        </div>
    </div>

    <div class="club-achievements">
        <h2>Club Achievements</h2>
        <p>Our club has achieved several milestones over the years, including... Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sequi culpa corporis quae totam saepe dignissimos ipsa repudiandae ad optio voluptates, ratione ducimus omnis veniam eius pariatur. Tempora illo nostrum eaque?</p>
    </div>
        
    <div class="membership-benefits">
        <h2>Membership Benefits</h2>
        <div class="benefit-container">
            <div class="benefit-item">
                <p>Benefit 1</p>
            </div>
            <div class="benefit-item">
                <p>Benefit 2</p>
            </div>
            <div class="benefit-item">
                <p>Benefit 3</p>
            </div>
            <div class="benefit-item">
                <p>Benefit 4</p>
            </div>
        </div>
        <div class="member-button-container">
            <button class="member-button">Become a Member</button>
        </div> 
    </div>  
    
    <div class="social-media">
        <ul>
          <li><a href="https://www.instagram.com" target="_blank"><i class="fa-brands fa-square-instagram"></i></a></li>
          <li><a href="https://www.facebook.com" target="_blank"><i class="fa-brands fa-square-facebook"></i></a></li>
          <li><a href="https://www.linkedin.com" target="_blank"><i class="fa-brands fa-linkedin"></i></a></li>
          <li><a href="https://www.twitter.com" target="_blank"><i class="fa-brands fa-square-x-twitter"></i></a></li>
          <li><a href="mailto:someone@example.com"><i class="fa-solid fa-envelope"></i></a></li>
        </ul>
      </div>
      
        
    <!-- Event Section -->
<div class="event-section">
    <h2>Ongoing Events</h2>
    <div class="event-container">
        <div class="event-card" style="background-image: url('event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 1"></div>
            <div class="event-description">Ongoing Event 1 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button>
        </div>
        <div class="event-card" style="background-image: url('event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 2"></div>
            <div class="event-description">Ongoing Event 2 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button>
        </div>
        <div class="event-card" style="background-image: url('event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 3"></div>
            <div class="event-description">Ongoing Event 3 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button>
        </div>
        <div class="event-card" style="background-image: url('event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 3"></div>
            <div class="event-description">Ongoing Event 3 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button>
        </div>
        <div class="event-card" style="background-image: url('event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 1"></div>
            <div class="event-description">Ongoing Event 1 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button>
        </div>
    </div>
    <h2>Upcoming Events</h2>
    <div class="event-container">
        <div class="event-card" style="background-image: url('event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 4"></div>
            <div class="event-description">Upcoming Event 1 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button> 
        </div>
        <div class="event-card" style="background-image: url('event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 5"></div>
            <div class="event-description">Upcoming Event 2 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button>
        </div>
        <div class="event-card" style="background-image: url('event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 6"></div>
            <div class="event-description">Upcoming Event 3 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button> 
        </div>
        <div class="event-card" style="background-image: url('event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 6"></div>
            <div class="event-description">Upcoming Event 3 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button> 
        </div>
        <div class="event-card" style="background-image: url('event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 4"></div>
            <div class="event-description">Upcoming Event 1 - A brief description.</div>
            <button class="read-more-btn" onclick="openPopup()">Read More</button> 
        </div>
    </div>
    <h2>Featured Events</h2>
    <div class="event-container">
        <div class="event-card" style="background-image: url('event.jpg');">
            <div class="event-logo"><img src="event_logo.png" alt="Event Logo 4"></div>
            <div class="event-description">Featured Event 1 - A brief description.</div>
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
    </script>
</body>
</html>