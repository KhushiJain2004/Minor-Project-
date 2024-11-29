<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Club admin Dash</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/js/clubAdminDash.js"></script>
    <script src="${pageContext.request.contextPath}/js/nav.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
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
        font-family: "Roboto", sans-serif;
        background-color: #e9f2f9;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        height: 100vh;
      }

      nav {
        position: absolute; /* Position it absolutely */
        top: 0; /* Align to the top */
        left: 0; /* Align to the left */
        width: 100%; /* Full width */
        background-color: #e9f2f9; /* Ensure background is set */
        z-index: 1000; /* Ensure it stays above other content */
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
        display: flex; /* Flexbox for alignment */
        align-items: center; /* Center vertically */
        justify-content: center; /* Center horizontally */
        padding: 50px; /* Optional: Add some padding around the logo */
      }

      /* .logo {
        align-items: bottom;
      }

      /* Styling the logo image */
      /* .logo img {
        padding-top: 30px;
        height: 250px; 
        width: 300px; 
        max-width: 100%; 
        transition: transform 0.3s ease; 
      } */ 

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
        /* .wrapper .nav-links {
          position: fixed;
          height: 100vh;
          width: 100%;
          max-width: 350px;
          top: 0;
          left: -100%;
          background: #027aa8;
          display: block;
          padding: 50px 10px;
          line-height: 50px;
          overflow-y: auto;
          transition: all 0.3s ease; */
        /* } */
        /* Custom scrollbar */
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

      .section {
        margin: 30px 0;
        width: 300px;
        max-width: 1000px;
        width: 100%;
        padding: 20px;
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      }
      .section h2 {
        font-size: 24px;
        color: #027aa8;
        margin-bottom: 20px;
      }
      .task-container {
        display: flex; 
        align-items: flex-start; 
        gap: 20px; 
        flex-wrap: wrap; 
      }
      .task-card {
        background-color: #fff;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease;
      }
      .task-card:hover {
        transform: translateY(-10px);
      }
      .task-details {
        font-size: 16px;
        margin-bottom: 15px;
        max-height: 260px; 
        overflow: hidden; 
        text-overflow: ellipsis; 
        white-space: nowrap; 
      }

      .task-details strong {
        font-size: 18px;
        color: #333;
      }
      .task-details span {
        display: block;
        color: #666;
        margin: 5px 0;
      }
      .task-actions {
        display: flex;
        gap: 10px;
        justify-content: space-between;
        font-size: 14px;
      }
      .task-actions a {
        color: #027aa8;
        text-decoration: none;
        padding: 5px;
        transition: color 0.2s ease;
      }
      .task-actions a:hover {
        color: #015f85;
      }
      .add-card {
        background-color: #027aa8;
        color: #fff;
        padding: 20px;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 32px;
        cursor: pointer;
        width: 70px;
        height: 70px;
        margin: auto;
      }
      .add-card:hover {
        background-color: #015f85;
      }
      .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.6);
        justify-content: center;
        align-items: center;
      }
      .modal-content {
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        max-width: 500px;
        width: 90%;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
      }
      .modal-header {
        font-size: 22px;
        margin-bottom: 20px;
        color: #027aa8;
      }
      .modal-footer {
        display: flex;
        justify-content: flex-end;
      }
      .modal-footer button {
        background-color: #027aa8;
        color: #fff;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
      }
      .modal-footer button:hover {
        background-color: #015f85;
      }
      .input-group {
        margin-bottom: 20px;
      }
      .input-group label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
      }
      .input-group input,
      .input-group textarea {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        font-size: 14px;
      }
      .input-group textarea {
        resize: vertical;
        height: 100px;
      }

      .sidebar {
        width: 18%;
        min-height: 150vh;
        background-color: #2c3e50;
        color: #ecf0f1;
        padding: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        position: fixed; 
        left: 0; 
        top: 73px; 
        box-sizing: border-box;
      }


      .admin-photo img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        border: 2px solid #ecf0f1;
        margin-bottom: 15px;
      }

      .admin-details {
        text-align: center;
        margin-bottom: 20px;
      }

      .admin-name {
        font-size: 22px;
        font-weight: bold;
        margin-bottom: 8px;
      }

      .club-name {
        font-size: 18px;
        margin-bottom: 4px;
      }

      .position {
        font-size: 16px;
        font-style: italic;
        margin-bottom: 12px;
      }

      .email,
      .contact {
        font-size: 14px;
        margin-bottom: 6px;
      }

      /* Logout Button Styles */
      .dash-button {
        /* margin-top: auto; */
        width: 60%;
        padding: 10px;
        background-color: white;
        color: black;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s;
        margin: 20px 0;;
      }

      .logout-button:hover {
        background-color: #c0392b;
      }
      
      /* Modal container */
.updateModal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgba(0, 0, 0, 0.6);
  z-index: 1000;
}

/* Form container */
.updateForm {
  background-color: #fff;
  border-radius: 10px;
  padding: 30px;
  width: 90vw;
  max-width: 1200px;
  max-height: 90vh; /* Ensures it doesn't overflow the screen */
  overflow-y: auto; /* Adds scroll for content overflow */
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  animation: fadeIn 0.3s ease;
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  justify-content: space-between;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: scale(0.95);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

/* Form header */
.updateForm h2 {
  flex-basis: 100%;
  text-align: center;
  font-size: 28px;
  color: #333;
  margin-bottom: 20px;
}

/* Field styles */
.field {
  flex-basis: calc(50% - 20px); /* Two fields per row */
  display: flex;
  flex-direction: column;
}

.field label {
  margin-bottom: 5px;
  font-weight: bold;
  font-size: 14px;
  color: #555;
}

.field input[type="text"],
.field input[type="email"] {
  padding: 10px;
  font-size: 14px;
  border: 1px solid #ddd;
  border-radius: 5px;
  transition: all 0.3s;
}

.field input:focus {
  border-color: #007bff;
  box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
  outline: none;
}

/* Full-width fields */
.inputContainer,
.positionHolderField {
  flex-basis: 100%;
}

/* Button styles */
button {
  background-color: #007bff;
  color: #fff;
  border: none;
  padding: 10px 15px;
  font-size: 14px;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #0056b3;
}

/* List fields (Achievements and Social Media) */
.listField {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.socialMediaField {
  display: flex;
  gap: 10px;
  margin-bottom: 10px;
}

.positionHolderField {
  display: flex;
  gap: 10px;
  margin-bottom: 10px;
}

/* Submit button */
#submitButton {
  flex-basis: 100%;
  padding: 12px;
  font-size: 16px;
  font-weight: bold;
  margin-top: 20px;
}

/* Responsive adjustments for smaller screens */
@media (max-width: 768px) {
  .field {
    flex-basis: 100%; /* Single field per row on smaller screens */
  }

  .updateForm {
    width: 95vw;
    flex-direction: column;
  }

  #submitButton {
    margin-top: 10px;

    /* Styling for the delete button */
.deleteAchievementBtn {
  background-color: #ff4d4d;
  color: #fff;
  border: none;
  padding: 5px 10px;
  font-size: 14px;
  margin-left: 10px;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.deleteAchievementBtn:hover {
  background-color: #cc0000;
}

/* Ensure the achievement field items are aligned properly */
.achievementField {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.achievementField input {
  flex: 1;
}

  }
}

    </style>
  </head>
  <body>
    <script>
      const clubAdmin=JSON.parse(localStorage.getItem("user"));
      console.log(clubAdmin);
      // console.log(clubAdmin.email);
      $(document).ready(function(e){
        document.getElementById("adminName").innerText=clubAdmin.username;
        // document.getElementById("clubName").textContent=clubAdmin.username;
        document.getElementById("email").textContent=clubAdmin.email;
        document.getElementById("role").textContent=clubAdmin.role;

      })
    </script>
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

    

    <div class="sidebar">
      <div class="admin-photo">
        <img src="https://via.placeholder.com/100" alt="Admin Photo" />
      </div>
      <div class="admin-details">
        <h2 class="admin-name" id="adminName"></h2>
        <!-- <p class="club-name" id="clubName">${status}</p> -->
        <p class="position" id="role">Club President</p>
        <p class="email" id="email">john.doe@example.com</p>
        <p class="contact">+123456789</p>
      </div>

      <button class="dash-button" id="updateButton">Update Profile</button>
      <button class="dash-button" onclick="logout()">Logout</button>
    </div>

    <div class="mainContent">
      <!-- Modal for Update Form -->
    <div class="updateModal" id="updateModal" style="display: none;">
      <div class="updateForm">
        <h2>Update Club Profile</h2>
        <div class="field">
          <label for="clubName">Club Name</label>
          <input type="text" id="clubName" placeholder="Club Name">
        </div>
        <div class="field">
          <label for="clubSlogan">Club Slogan</label>
          <input type="text" id="clubSlogan" placeholder="Club Slogan">
        </div>
        <div class="field">
          <label for="clubDescription">Club Description</label>
          <input id="clubDescription" placeholder="Club Description">
        </div>
        <div class="field">
          <label for="contactEmail">Contact Email</label>
          <input type="email" id="contactEmail" placeholder="Contact Email">
        </div>
        <div class="field">
          <label for="contactPhone">Contact Phone</label>
          <input type="text" id="contactPhone" placeholder="Contact Phone Number">
        </div>
        <div class="field">
          <label for="memberBenefits">Membership Benefits</label>
          <input id="memberBenefits" placeholder="Benefits for Club Members">
        </div>
        <div class="field">
          <label for="memberFee">Membership Fee</label>
          <input type="text" id="memberFee" placeholder="Membership Fee">
        </div>
        <div class="field">
          <div class="listField">
            <label for="achievements">Achievements</label>
            <button type="button" id="addInputFields">Add More</button>
          </div>
          <div class="inputContainer" id="inputContainer">
            <div class="achievementField">
              <input type="text" name="achievements" placeholder="Enter an achievement">
              <button type="button" class="deleteAchievementBtn">❌</button>
            </div>
          </div>
        </div>
        
        <div class="field">
          <div class="listField">
            <label for="">Social Media Links</label>
            <button type="button" id="addSocialMediaField">Add More</button>
          </div>
          <div id="socialMediaContainer" class="inputContainer">
            <div class="socialMediaField">
              <input type="text" name="socialMediaKey" placeholder="Platform (e.g., Facebook)">
              <input type="text" name="socialMediaValue" placeholder="URL (e.g., https://facebook.com)">
            </div>
          </div>
        </div> 
        <div class="field">
          <label for="">Position Holders</label>
          <div id="positionHoldersContainer">
            <label for="">Member1</label>
            <div class="positionHolderField">
              <input type="text" name="name1" placeholder="Name">
              <input type="text" name="designation1" placeholder="Designation">
            </div>
          </div>
          <div id="positionHoldersContainer">
            <label for="">Member2</label>
            <div class="positionHolderField">
              <input type="text" name="name2" placeholder="Name">
              <input type="text" name="designation2" placeholder="Designation">
            </div>
          </div>
          <div id="positionHoldersContainer">
            <label for="">Member3</label>
            <div class="positionHolderField">
              <input type="text" name="name3" placeholder="Name">
              <input type="text" name="designation3" placeholder="Designation">
            </div>
          </div>
        </div>  
        <button id="submitButton">Submit</button>     
      </div>
    </div>

      
      <!-- Regular Task Manager Section -->
      <div class="section">
        <h2>Upcomming events</h2>
        <div class="task-container" id="taskContainer">
          <div class="add-card" onclick="showModal()">
            <i class="fa fa-plus"></i>
          </div>
        </div>
      </div>
  
      
  
      <!-- Modal for Adding/Editing Task -->
      <div id="taskModal" class="modal">
        <div class="modal-content">
          <div class="modal-header">Add Task</div>
          <div class="input-group">
            <label for="taskInput">Task:</label>
            <input type="text" id="taskInput" />
          </div>
          <div class="input-group">
            <label for="eventDescription">Event Description:</label>
            <textarea id="eventDescription"></textarea>
          </div>
          <div class="input-group">
            <label for="dateFrom">Date From:</label>
            <input type="date" id="dateFrom" />
          </div>
          <div class="input-group">
            <label for="dateTo">Date To:</label>
            <input type="date" id="dateTo" />
          </div>
          <div class="input-group">
            <label for="eventManager">Event Manager:</label>
            <input type="text" id="eventManager" />
          </div>
          <div class="modal-footer">
            <button onclick="saveTask()">Add</button>
          </div>
        </div>
      </div>
  
      
      <script>
        let tasks = [];
        let importantEvents = [];
      
        // Show update modal
        document.getElementById("updateButton").addEventListener("click", function () {
          document.getElementById("updateModal").style.display = "block";
        });
      
        // Close update modal on outside click
        document.getElementById("updateModal").addEventListener("click", function (e) {
          if (e.target == document.getElementById("updateModal")) {
            resetModal(document.getElementById("updateModal"));
            document.getElementById("updateModal").style.display = "none";
          }
        });
      
        // Add dynamic achievement fields
        document.getElementById("addInputFields").addEventListener("click", function () {
          const div = document.getElementById("inputContainer");
          const field = document.createElement("div");
          field.className = "achievementField";
          field.innerHTML = `
            <input type="text" name="achievements" placeholder="Enter an achievement">
            <button type="button" class="deleteAchievementBtn">❌</button>
          `;
          div.appendChild(field);
        });
      
        // Add dynamic social media fields
        document.getElementById("addSocialMediaField").addEventListener("click", () => {
          const container = document.getElementById("socialMediaContainer");
          const field = document.createElement("div");
          field.className = "socialMediaField";
          field.innerHTML = `
            <input type="text" name="socialMediaKey" placeholder="Platform (e.g., Facebook)">
            <input type="text" name="socialMediaValue" placeholder="URL (e.g., https://facebook.com)">
            <button type="button" class="deleteSocialMediaBtn">❌</button>
          `;
          container.appendChild(field);
        });
      
        // Ensure delete button works for achievements
        document.getElementById("inputContainer").addEventListener("click", function (e) {
          if (e.target.classList.contains("deleteAchievementBtn")) {
            e.target.parentElement.remove();
          }
        });
      
        // Ensure delete button works for social media fields
        document.getElementById("socialMediaContainer").addEventListener("click", (e) => {
          if (e.target.classList.contains("deleteSocialMediaBtn")) {
            e.target.parentElement.remove();
          }
        });
      
        // Task Modal Functions
        function showModal(editTaskIndex = null) {
          const taskModal = document.getElementById("taskModal");
          resetModal(taskModal); // Reset modal fields
      
          if (editTaskIndex !== null) {
            const task = tasks[editTaskIndex];
            document.getElementById("taskInput").value = task.name;
            document.getElementById("eventDescription").value = task.description;
            document.getElementById("dateFrom").value = task.dateFrom;
            document.getElementById("dateTo").value = task.dateTo;
            document.getElementById("eventManager").value = task.eventManager;
            taskModal.dataset.editing = editTaskIndex;
          }
          taskModal.style.display = "flex";
        }
      
        function hideModal() {
          document.getElementById("taskModal").style.display = "none";
        }
      
        function saveTask() {
          const taskInput = document.getElementById("taskInput").value;
          const eventDescription =
            document.getElementById("eventDescription").value;
          const dateFrom = document.getElementById("dateFrom").value;
          const dateTo = document.getElementById("dateTo").value;
          const eventManager = document.getElementById("eventManager").value;
          const taskModal = document.getElementById("taskModal");
          const editTaskIndex = taskModal.dataset.editing;
      
          if (taskInput.trim() !== "" && eventManager.trim() !== "") {
            const taskData = {
              name: taskInput,
              description: eventDescription,
              dateFrom: dateFrom,
              dateTo: dateTo,
              eventManager: eventManager,
            };
      
            if (editTaskIndex) {
              tasks[editTaskIndex] = taskData;
            } else {
              tasks.push(taskData);
            }
      
            renderTasks();
            hideModal();
          }
        }
      
        function renderTasks() {
          const taskContainer = document.getElementById("taskContainer");
          taskContainer.innerHTML =
            '<div class="add-card" onclick="showModal()"><i class="fa fa-plus"></i></div>'; // Reset task list
      
          tasks.forEach((task, index) => {
            const taskCard = document.createElement("div");
            taskCard.classList.add("task-card");
      
            taskCard.innerHTML = `
                  <div class="task-details">
                      <strong>${task.name}</strong><br>
                      <span>${task.description}</span><br>
                      <span>From: ${task.dateFrom}</span><br>
                      <span>To: ${task.dateTo}</span><br>
                      <span>Manager: ${task.eventManager}</span>
                  </div>
                  <div class="task-actions">
                      <a href="#" onclick="deleteTask(${index})">Delete</a>
                      <a href="#" onclick="showModal(${index})">Change</a>
                  </div>
              `;
      
            taskContainer.appendChild(taskCard);
          });
        }
      
        function deleteTask(index) {
          if (confirm("Are you sure you want to delete this task?")) {
            tasks.splice(index, 1);
            renderTasks();
          }
        }
      
        // Important Event Modal Functions
        function showEventModal(editEventIndex = null) {
          const eventModal = document.getElementById("eventModal");
          resetModal(eventModal); // Reset modal fields
      
          if (editEventIndex !== null) {
            const event = importantEvents[editEventIndex];
            document.getElementById("eventInput").value = event.name;
            document.getElementById("importantEventDescription").value =
              event.description;
            document.getElementById("eventDateFrom").value = event.dateFrom;
            document.getElementById("eventDateTo").value = event.dateTo;
            document.getElementById("importantEventManager").value =
              event.eventManager;
            eventModal.dataset.editing = editEventIndex;
          }
          eventModal.style.display = "flex";
        }
      
        function hideEventModal() {
          document.getElementById("eventModal").style.display = "none";
        }
      
        function saveImportantEvent() {
          const eventInput = document.getElementById("eventInput").value;
          const importantEventDescription = document.getElementById(
            "importantEventDescription"
          ).value;
          const eventDateFrom = document.getElementById("eventDateFrom").value;
          const eventDateTo = document.getElementById("eventDateTo").value;
          const importantEventManager = document.getElementById(
            "importantEventManager"
          ).value;
          const eventModal = document.getElementById("eventModal");
          const editEventIndex = eventModal.dataset.editing;
      
          if (eventInput.trim() !== "" && importantEventManager.trim() !== "") {
            const eventData = {
              name: eventInput,
              description: importantEventDescription,
              dateFrom: eventDateFrom,
              dateTo: eventDateTo,
              eventManager: importantEventManager,
            };
      
            if (editEventIndex) {
              importantEvents[editEventIndex] = eventData;
            } else {
              importantEvents.push(eventData);
            }
      
            renderImportantEvents();
            hideEventModal();
          }
        }
      
        function renderImportantEvents() {
          const importantEventContainer = document.getElementById(
            "importantEventContainer"
          );
          importantEventContainer.innerHTML =
            '<div class="add-card" onclick="showEventModal()"><i class="fa fa-plus"></i></div>'; // Reset list
      
          importantEvents.forEach((event, index) => {
            const eventCard = document.createElement("div");
            eventCard.classList.add("task-card");
      
            eventCard.innerHTML = `
                  <div class="task-details">
                      <strong>${event.name}</strong><br>
                      <span>${event.description}</span><br>
                      <span>From: ${event.dateFrom}</span><br>
                      <span>To: ${event.dateTo}</span><br>
                      <span>Manager: ${event.eventManager}</span>
                  </div>
                  <div class="task-actions">
                      <a href="#" onclick="deleteImportantEvent(${index})">Delete</a>
                      <a href="#" onclick="showEventModal(${index})">Change</a>
                  </div>
              `;
      
            importantEventContainer.appendChild(eventCard);
          });
        }
      
        function deleteImportantEvent(index) {
          if (confirm("Are you sure you want to delete this event?")) {
            importantEvents.splice(index, 1);
            renderImportantEvents();
          }
        }
      
        // Reset modal inputs
        function resetModal(modal) {
          modal.dataset.editing = "";
          const inputs = modal.querySelectorAll("input, textarea");
          inputs.forEach((input) => (input.value = ""));
        }
      
        // Close modal when clicking outside of it
        window.onclick = function (event) {
          const taskModal = document.getElementById("taskModal");
          const eventModal = document.getElementById("eventModal");
          if (event.target == taskModal) {
            hideModal();
          }
          if (event.target == eventModal)
            hideEventModal();
        };
      $("#logoutLink").on("click", function(e) {
            e.preventDefault(); // Prevent the default link behavior
            logout();
      });
    
    </script>
  </body>
</html>
