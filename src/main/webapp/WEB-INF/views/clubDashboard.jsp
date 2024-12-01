<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Club Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/clubDashboard.css">
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

          <div class="social-media">
            <ul>
              <li><a href="https://www.instagram.com" target="_blank"><i class="fa-brands fa-square-instagram"></i></a></li>
              <li><a href="https://www.facebook.com" target="_blank"><i class="fa-brands fa-square-facebook"></i></a></li>
              <li><a href="https://www.linkedin.com" target="_blank"><i class="fa-brands fa-linkedin"></i></a></li>
              <li><a href="https://www.twitter.com" target="_blank"><i class="fa-brands fa-twitter"></i></a></li>
              <li><a href="mailto:someone@example.com"><i class="fa-solid fa-envelope"></i></a></li>
            </ul>
          </div>

    <div class="mainContainer">
        <div class="bg-image">
            <!-- <img src="images/logo.jpeg" alt="Club Logo" class="clublogo"> -->
            <div class="content">
                <h2 class="welcome">Welcome to,</h2>
                <h1 id="clubName">Club Name</h1>
                <p class="bio" id="slogan">This is a short bio or about the club. It should provide a brief overview of the club's mission, activities, and values. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nulla ullam optio sed! Exercitationem vero, enim dolores pariatur quaerat vel suscipit, officia debitis, ratione facere molestias cupiditate rem repellendus? Accusamus, blanditiis.</p>
                <!-- <p class="keywords">Keywords: Music, Arts, Technology</p>   -->
                <!--  -->
                </div>
            </div>
        </div>

        <hr>
        <div class="info">
            <div class="about">
                <h1>About Us</h1>
            <p id="description" class="description"></p>
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
            <hr>
            <div class="dashboardSection">
                <div class="sectionText">
                    <h2>Our achievements</h2>
                    <p id="achievements"></p> 
                </div>
                <div class="imageContainer">
                    <div class="achievementImage"></div>
                </div>
            </div>
            <hr>
            <div class="dashboardSection">
                <div class="imageContainer">
                    <div class="benifitImage"></div>
                </div>
                <div class="sectionText">
                    <h2>MemberShip Benefits</h2>
                    <p id="membership"></p> 
                </div>
            </div>
            <!-- <h2</h2> -->
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
    </script>
</body>
</html>