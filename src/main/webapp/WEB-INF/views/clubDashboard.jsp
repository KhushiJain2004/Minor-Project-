<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Club Dashboard</title>
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
        body {
            background-color: #E2F3FB;
            margin: 0;
            font-family: 'Poppins', sans-serif;
        }
        header, footer {
            background-color: #027AA8;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .mainContainer
        {
            position:absolute;
            margin-top:80%;   
            width:80%;
        }

        .clubcontainer {
            position: relative;
            z-index:10;
            text-align: center;
            padding: 20px;
            max-width: 80%;
            margin: 40px auto;
            margin-top:80px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
        }
        .bg-image {
            background-image: url('images/bg.jpg'); 
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
        .clublogo {
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
    <header>
        <nav>
            <div class="wrapper">
              <div class="logo">
                <a href="#">
                  <img src="images/UPES University of Petroleum and Energy Studies.png" alt="Logo" />
                </a>
              </div>
              <input type="radio" name="slider" id="menu-btn" />
              <input type="radio" name="slider" id="close-btn" />
              <ul class="nav-links">
                <label for="close-btn" class="btn close-btn">
                  <i class="fas fa-times"></i>
                </label>
                <li><a href="/home">Home</a></li>
                <!-- <li><a href="/clubs">Clubs</a></li> -->
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

    <div class="mainContainer">
        <div class="clubcontainer">
            <div class="bg-image"></div>
            <img src="images/logo.jpeg" alt="Club Logo" class="clublogo">
            <div class="content">
                <h1 id="clubName">Club Name</h1>
                <p class="bio" id="description">This is a short bio or about the club. It should provide a brief overview of the club's mission, activities, and values. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nulla ullam optio sed! Exercitationem vero, enim dolores pariatur quaerat vel suscipit, officia debitis, ratione facere molestias cupiditate rem repellendus? Accusamus, blanditiis.</p>
                <p class="keywords">Keywords: Music, Arts, Technology</p>
                <div class="members">
                    <div class="member">
                        <img src="images/pic.png" alt="Member 1">
                        <div class="member-name" id="member1name">Member Name 1</div>
                        <div class="member-designation" id="member1designation">Designation 1</div>
                    </div>
                    <div class="member">
                        <img src="images/pic.png" alt="Member 2">
                        <div class="member-name" id="member2name">Member Name 2</div>
                        <div class="member-designation" id="member2designation">Designation 2</div>
                    </div>
                    <div class="member">
                        <img src="images/pic.png" alt="Member 3">
                        <div class="member-name" id="member3name" >Member Name 3</div>
                        <div class="member-designation" id="member3designation">Designation 3</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Event Section -->
    <div class="event-section">
        <h2>Ongoing Events</h2>
        <div class="event-container">
            <div class="event-card" style="background-image: url('images/event.jpg');">
                <div class="event-logo"><img src="images/event_logo.png" alt="Event Logo 1"></div>
                <div class="event-description">Ongoing Event 1 - A brief description.</div>
                <button class="read-more-btn" onclick="openPopup()">Read More</button>
            </div>
            <div class="event-card" style="background-image: url('images/event.jpg');">
                <div class="event-logo"><img src="images/event_logo.png" alt="Event Logo 2"></div>
                <div class="event-description">Ongoing Event 2 - A brief description.</div>
                <button class="read-more-btn" onclick="openPopup()">Read More</button>
            </div>
            <div class="event-card" style="background-image: url('images/event.jpg');">
                <div class="event-logo"><img src="images/event_logo.png" alt="Event Logo 3"></div>
                <div class="event-description">Ongoing Event 3 - A brief description.</div>
                <button class="read-more-btn" onclick="openPopup()">Read More</button>
            </div>
        </div>
        <h2>Upcoming Events</h2>
        <div class="event-container">
            <div class="event-card" style="background-image: url('images/event.jpg');">
                <div class="event-logo"><img src="images/event_logo.png" alt="Event Logo 4"></div>
                <div class="event-description">Upcoming Event 1 - A brief description.</div>
                <button class="read-more-btn" onclick="openPopup()">Read More</button> 
            </div>
            <div class="event-card" style="background-image: url('images/event.jpg');">
                <div class="event-logo"><img src="images/event_logo.png" alt="Event Logo 5"></div>
                <div class="event-description">Upcoming Event 2 - A brief description.</div>
                <button class="read-more-btn" onclick="openPopup()">Read More</button>
            </div>
            <div class="event-card" style="background-image: url('images/event.jpg');">
                <div class="event-logo"><img src="images/event_logo.png" alt="Event Logo 6"></div>
                <div class="event-description">Upcoming Event 3 - A brief description.</div>
                <button class="read-more-btn" onclick="openPopup()">Read More</button> 
            </div>
        </div>
        <h2>Featured Events</h2>
        <div class="event-container">
            <div class="event-card" style="background-image: url('images/event.jpg');">
                <div class="event-logo"><img src="images/event_logo.png" alt="Event Logo 4"></div>
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
                        <img src="images/event_logo.png" alt="Event Logo">
                    </div>
                    <button class="register-btn">Register</button>
                </div>
                <div class="popup-image">
                    <img src="images/event.jpg" alt="Event Image">
                </div>
                <div class="popup-info">
                    <h3>Event Name</h3>
                    <p>Here is the detailed description of the event. This section will contain all the deep information about the event such as its schedule, speakers, venue, and more. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Blanditiis, ab officia at, aspernatur id optio expedita minus cupiditate fugiat dolorem velit incidunt! Nulla nihil architecto temporibus similique ullam neque non.</p>
                </div>
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