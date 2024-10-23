<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Landing Page</title>
    <link rel="stylesheet" href="style.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        background: #E2F3FB;
        overflow: hidden;
      }
      .profile-icon {
        width: 40px; 
        height: 40px; 
        border-radius: 50%;
        margin:auto; 
        margin-right:10px;

      }
      #profile-item
      {
        cursor:pointer;
      }
      #username
      {
        font-weight: bold;
      }
      
      .container {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 1400px;
        height: 600px;
        background: #f5f5f5;
      }

      .container .slide .item {
        width: 200px;
        height: 300px;
        position: absolute;
        top: 50%;
        transform: translate(0, -50%);
        border-radius: 20px;
        background-position: 50% 50%;
        background-size: cover;
        display: inline-block;
        transition: 0.5s;
      }

      .slide .item:nth-child(1),
      .slide .item:nth-child(2) {
        top: 0;
        left: 0;
        transform: translate(0, 0);
        border-radius: 0;
        width: 100%;
        height: 100%;
      }

      .slide .item:nth-child(3) {
        left: 80%;
      }
      .slide .item:nth-child(4) {
        left: calc(80% + 220px);
      }
      .slide .item:nth-child(5) {
        left: calc(80% + 220px);
      }

      /* here n = 0, 1, 2, 3,... */
      .slide .item:nth-child(n + 6) {
        left: calc(80% + 220px);
        opacity: 0;
      }

      .item .content {
        position: absolute;
        top: 50%;
        left: 100px;
        width: 300px;
        text-align: left;
        color: #eee;
        transform: translate(0, -50%);
        font-family: system-ui;
        display: none;
      }

      .content button:hover {
        color: #ffffff; /* White */
        background-color: #ff8c00; /* Dark orange */
      }

      .slide .item:nth-child(2) .content {
        display: block;
      }

      .content .name {
        font-size: 40px;
        text-transform: uppercase;
        font-weight: bold;
        opacity: 0;
        animation: animate 1s ease-in-out 1 forwards;
      }

      .content .des {
        margin-top: 10px;
        margin-bottom: 20px;
        opacity: 0;
        animation: animate 1s ease-in-out 0.3s 1 forwards;
      }

      .content button {
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        opacity: 0;
        animation: animate 1s ease-in-out 0.6s 1 forwards;
      }

      @keyframes animate {
        from {
          opacity: 0;
          transform: translate(0, 100px);
          filter: blur(33px);
        }

        to {
          opacity: 1;
          transform: translate(0);
          filter: blur(0);
        }
      }

      .button {
        width: 100%;
        text-align: center;
        position: absolute;
        bottom: 20px;
      }

      .button button {
        width: 40px;
        height: 35px;
        border-radius: 8px;
        border: none;
        cursor: pointer;
        margin: 0 5px;
        border: 1px solid #000;
        transition: 0.3s;
      }

      .button button:hover {
        background: #ababab;
        color:#015f85 ;
      }
      /* Navbar styling */
nav {
    position: absolute;
    z-index: 99;
    width: 100%;
    background: #FFF;
}

nav .wrapper {
    position: relative;
    max-width: 1300px;
    padding: 0px 30px;
    height: 70px;
    line-height: 70px;
    margin: auto;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

/* Logo styling */
.wrapper .logo {
    display: flex; /* Flexbox for alignment */
    align-items: center; /* Center vertically */
    justify-content: center; /* Center horizontally */
    padding: 10px; /* Optional: Add some padding around the logo */
}

.logo {
    align-items: bottom;
}

/* Styling the logo image */
.logo img {
  padding-top: 30px;
    height: 200px; /* Initial height for the logo */
    width: 300px; /* Maintain aspect ratio */
    max-width: 100%; /* Ensure the logo fits within the container */
    transition: transform 0.3s ease; /* Smooth transition effect */
}

/* Adding a hover effect for the logo */
.logo a:hover img {
    transform: scale(1.05); /* Slightly enlarge the logo on hover */
}

/* Responsive adjustments */
@media screen and (max-width: 970px) {
    .logo img {
        height: 80px;
        width: 40px; /* Adjust height for smaller screens */
    }
}

@media screen and (max-width: 600px) {
    .logo img {
        height: 80px;
        width: 40px; /* Adjust height for even smaller screens */
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
    .wrapper .nav-links {
        position: fixed;
        height: 100vh;
        width: 100%;
        max-width: 350px;
        top: 0;
        left: -100%;
        background: #027AA8;
        display: block;
        padding: 50px 10px;
        line-height: 50px;
        overflow-y: auto;
        transition: all 0.3s ease;
    }
    /* Custom scrollbar */
    ::-webkit-scrollbar {
        width: 10px;
    }
    ::-webkit-scrollbar-track {
        background: #027AA8;
    }
    ::-webkit-scrollbar-thumb {
        background: #027AA8;
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
    .nav-links .mobile-item {
        display: block;
        color: #f2f2f2;
        font-size: 20px;
        font-weight: 500;
        padding-left: 20px;
        cursor: pointer;
        border-radius: 5px;
        transition: all 0.3s ease;
    }
    .nav-links .mobile-item:hover {
        background: #027AA8;
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

    </style>
  </head>

  <body>
    <nav>
      <div class="wrapper">
        <div class="logo">
          <a href="#">
            <img
              src="images/UPES University of Petroleum and Energy Studies.png"
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
          <li><a href="#">Home</a></li>
          <li><a href="/clubs">Clubs</a></li>
          <!-- <li><a href="clubAdminDash.jsp">Feedback</a></li> -->
          <li id="login-link"><a href="/login">Login</a></li>
          <li id="profile-item" style="display: none;">
            <a href="#" id="logoutLink">Logout</a>
            <img src="images/profile.png" alt="Profile" class="profile-icon" />
            <span id="username"></span> <!-- Placeholder for user's name -->
          </li>
        </ul>
        <label for="menu-btn" class="btn menu-btn">
          <i class="fas fa-bars"></i>
        </label>
      </div>
    </nav>
    

    <div class="container">
      <div class="slide">
        <div
          class="item"
          style="background-image: url('images/group.jpg')"
        >
          <div class="content">
            <div class="name">UPES ACM</div>
            <div class="des">
              Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab, eum!
            </div>
            <button>See More</button>
          </div>
        </div>
        <div
          class="item"
          style="background-image: url('/images/mtc.jpeg')"
        >
          <div class="content">
            <div class="name">Microsoft Technical Community - UPES</div>
            <div class="des">
              Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab, eum!
            </div>
            <button>See More</button>
          </div>
        </div>
        <div
          class="item"
          style="background-image:url('/images/csi.jpeg')"
        >
          <div class="content">
            <div class="name">Computer Society of India</div>
            <div class="des">
              Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab, eum!
            </div>
            <button>See More</button>
          </div>
        </div>
        <div
          class="item"
          style="background-image: url('/images/inf.jpeg')"
        >
          <div class="content">
            <div class="name">Infinity Club – Aerospace</div>
            <div class="des">
              Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab, eum!
            </div>
            <button>See More</button>
          </div>
        </div>
        <div
          class="item"
          style="background-image: url('/images/fipi.jpg')"
        >
          <div class="content">
            <div class="name">UPES FIPI Student Chapter</div>
            <div class="des">
              Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab, eum!
            </div>
            <button>See More</button>
          </div>
        </div>
        <div
          class="item"
          style="background-image: url('/images/spe.png')"
        >
          <div class="content">
            <div class="name">SPE - Society of Petroleum Engineers</div>
            <div class="des">
              Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab, eum!
            </div>
            <button>See More</button>
          </div>
        </div>
      </div>
      <div class="button">
        <button class="next"><i class="fa-solid fa-arrow-left"></i></button>
        <button class="prev"><i class="fa-solid fa-arrow-right"></i></button>
      </div>
    </div>


  </div>

    <script>
      let next = document.querySelector(".next");
      let prev = document.querySelector(".prev");

      next.addEventListener("click", function () {
        let items = document.querySelectorAll(".item");
        document.querySelector(".slide").appendChild(items[0]);
      });

      prev.addEventListener("click", function () {
        let items = document.querySelectorAll(".item");
        document.querySelector(".slide").prepend(items[items.length - 1]);
      });
      $("#logoutLink").on("click", function(e) {
            e.preventDefault(); // Prevent the default link behavior
            logout();
      });
    </script>
  </body>
</html>
