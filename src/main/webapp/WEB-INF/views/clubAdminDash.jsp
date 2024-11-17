<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Club admin Dash</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
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
        /* .nav-links .mobile-item {
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
          background: #027aa8;
        } */
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
        max-height: 260px; /* Adjust based on your preference */
        overflow: hidden; /* Hide overflow */
        text-overflow: ellipsis; /* Show ellipsis (...) when text overflows */
        white-space: nowrap; /* Prevent text from wrapping */
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
        width: 250px;
        height: 150vh;
        background-color: #2c3e50;
        color: #ecf0f1;
        padding: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        position: fixed; /* Fix the sidebar's position */
        left: 0; /* Align it to the left */
        top: 73px; /* Align it to the top */
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
        margin-bottom: auto;
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
      .logout-button {
        margin-top: auto;
        width: 100%;
        padding: 10px;
        background-color: #e74c3c;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s;
      }

      .logout-button:hover {
        background-color: #c0392b;
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
        <h2>Ecosystem of clubs!</h2>
        <input type="radio" name="slider" id="menu-btn" />
        <input type="radio" name="slider" id="close-btn" />
        <ul class="nav-links">
          <label for="close-btn" class="btn close-btn">
            <i class="fas fa-times"></i>
          </label>
          <li><a href="/home">Home</a></li>
          <li><a href="/clubs">Clubs</a></li>
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
        <h2 class="admin-name">John Doe</h2>
        <p class="club-name">Tech Club</p>
        <p class="position">Club President</p>
        <p class="email">john.doe@example.com</p>
        <p class="contact">+123456789</p>
      </div>

      <button class="logout-button">Logout</button>
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

    <!-- Important Events Section -->
    <div class="section">
      <h2>Important Events</h2>
      <div class="task-container" id="importantEventContainer">
        <div class="add-card" onclick="showEventModal()">
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

    <!-- Modal for Important Events -->
    <div id="eventModal" class="modal">
      <div class="modal-content">
        <div class="modal-header">Add Important Event</div>
        <div class="input-group">
          <label for="eventInput">Event:</label>
          <input type="text" id="eventInput" />
        </div>
        <div class="input-group">
          <label for="importantEventDescription">Event Description:</label>
          <textarea id="importantEventDescription"></textarea>
        </div>
        <div class="input-group">
          <label for="eventDateFrom">Date From:</label>
          <input type="date" id="eventDateFrom" />
        </div>
        <div class="input-group">
          <label for="eventDateTo">Date To:</label>
          <input type="date" id="eventDateTo" />
        </div>
        <div class="input-group">
          <label for="importantEventManager">Event Manager:</label>
          <input type="text" id="importantEventManager" />
        </div>
        <div class="modal-footer">
          <button onclick="saveImportantEvent()">Add</button>
        </div>
      </div>
    </div>

    <script>
      let tasks = [];
      let importantEvents = [];

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

      // Helper: Reset Modal Inputs
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
        if (event.target == eventModal) {
          hideEventModal();
        }
      };
      $("#logoutLink").on("click", function(e) {
            e.preventDefault(); // Prevent the default link behavior
            logout();
      });
    
    </script>
  </body>
</html>
