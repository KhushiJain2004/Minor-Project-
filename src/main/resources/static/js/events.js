// Fetch events for a particular club
async function fetchClubEvents(clubId) {
    try {
        const response = await fetch(`/api/events/club/${clubId}`);
        if (response.ok) {
            const events = await response.json();
            renderEvents(events); // Function to populate the table with events
        } else {
            console.error("Failed to fetch events for club.");
        }
    } catch (error) {
        console.error("Error fetching club events:", error);
    }
}

// Create or update an event
async function saveEvent(eventData) {
    try {
        const method = eventData.id ? "PUT" : "POST";
        const endpoint = eventData.id
            ? `/api/events/${eventData.id}`
            : `/api/events`;

        const response = await fetch(endpoint, {
            method: method,
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(eventData),
        });

        if (response.ok) {
            console.log("Event saved successfully.");
            const savedEvent = await response.json();
            fetchClubEvents(eventData.clubId); // Refresh events
            resetForm(); // Clear the form after saving
        } else {
            console.error("Failed to save event.");
        }
    } catch (error) {
        console.error("Error saving event:", error);
    }
}

// Delete an event
async function deleteEvent(eventId, clubId) {
    try {
        const response = await fetch(`/api/events/${eventId}`, {
            method: "DELETE",
        });

        if (response.ok) {
            console.log("Event deleted successfully.");
            fetchClubEvents(clubId); // Refresh events
        } else {
            console.error("Failed to delete event.");
        }
    } catch (error) {
        console.error("Error deleting event:", error);
    }
}

// Populate the form with event data for editing
function populateForm(eventData) {
    document.getElementById("eventId").value = eventData.id || "";
    document.getElementById("eventName").value = eventData.eventName || "";
    document.getElementById("eventDescription").value =
        eventData.eventDescription || "";
    document.getElementById("startTime").value = eventData.startTime || "";
    document.getElementById("endTime").value = eventData.endTime || "";
    document.getElementById("tags").value = eventData.tags
        ? eventData.tags.join(", ")
        : "";
    document.getElementById("featured").checked = eventData.featured || false;
    document.getElementById("contactName").value =
        eventData.contact?.name || "";
    document.getElementById("contactEmail").value =
        eventData.contact?.email || "";
    document.getElementById("contactPhone").value =
        eventData.contact?.phone || "";
}

// Reset the form
function resetForm() {
    document.getElementById("eventForm").reset();
    document.getElementById("eventId").value = "";
}

// Render events in the table
function renderEvents(events) {
    const tableBody = document.querySelector("#eventsTable tbody");
    tableBody.innerHTML = ""; // Clear existing rows

    events.forEach((event) => {
        const row = document.createElement("tr");

        row.innerHTML = `
            <td>${event.eventName}</td>
            <td>${event.eventDescription}</td>
            <td>${event.startTime}</td>
            <td>${event.endTime}</td>
            <td>${event.tags ? event.tags.join(", ") : "N/A"}</td>
            <td>
                <button onclick='populateForm(${JSON.stringify(event)})'>Edit</button>
                <button onclick='deleteEvent("${event.id}", "${event.clubId}")'>Delete</button>
            </td>
        `;
        tableBody.appendChild(row);
    });
}

// Form submit handler
document.getElementById("eventForm").addEventListener("submit", (e) => {
    e.preventDefault();

    const eventData = {
        id: document.getElementById("eventId").value,
        clubId: "C12345", // Replace with the current club's ID
        eventName: document.getElementById("eventName").value,
        eventDescription: document.getElementById("eventDescription").value,
        startTime: document.getElementById("startTime").value,
        endTime: document.getElementById("endTime").value,
        tags: document
            .getElementById("tags")
            .value.split(",")
            .map((tag) => tag.trim()),
        featured: document.getElementById("featured").checked,
        contact: {
            name: document.getElementById("contactName").value,
            email: document.getElementById("contactEmail").value,
            phone: document.getElementById("contactPhone").value,
        },
    };

    saveEvent(eventData);
});
