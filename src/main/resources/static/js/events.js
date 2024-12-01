// Fetch ongoing events from the backend
$(document).ready(function()
{
    fetchEvents();

function fetchEvents() {
    fetch('/api/events')
        .then(response => response.json())
        .then(events => {
            // Call a function to render events
            console.log(events);    
            renderEvents(events);
        })
        .catch(error => console.log('Error fetching events:', error));
}

// Render events on the page
function renderEvents(events) {
    const eventContainer = document.querySelector('.event-container');
    eventContainer.innerHTML = ''; // Clear existing events

    events.forEach(event => {
        const eventCard = document.createElement('div');
        eventCard.classList.add('event-card');
        eventCard.style.backgroundImage = `url(${event.image})`; // Set background image for event card

        const eventContent = `
            <div class="event-logo">
                <img src="${event.logo}" alt="${event.eventName} Logo">
            </div>
            <h3 class="event-description">${event.eventName}</h3>
            <p>${event.eventDescription}</p>
            <button class="read-more-btn" onclick="openEventPopup(${event.id})">Read More</button>
        `;

        eventCard.innerHTML = eventContent;
        eventContainer.appendChild(eventCard);
    });
}

// Open event popup for details
function openEventPopup(eventId) {
    fetch(`/api/events/${eventId}`)
        .then(response => response.json())
        .then(event => {
            // Populate popup with event details
            document.querySelector('.popup-info h3').textContent = event.name;
            document.querySelector('.popup-info h4').textContent = event.clubName;
            document.querySelector('.popup-image img').src = event.image;
            document.querySelector('.popup-info p').textContent = event.description;
            document.getElementById('event-popup').classList.remove('hidden');
        })
        .catch(error => console.log('Error fetching event details:', error));
}

// Close event popup
document.getElementById('close-popup').addEventListener('click', () => {
    document.getElementById('event-popup').classList.add('hidden');
});

document.querySelector('.register-btn').addEventListener('click', () => {
    // Make an API call to register the user for the event
    fetch(`/api/events/register`, {
        method: 'POST',
        body: JSON.stringify({ eventId: eventId, userId: userId }), // Replace with actual data
        headers: {
            'Content-Type': 'application/json',
        }
    })
    .then(response => response.json())
    .then(data => {
        alert('Registration successful');
        document.getElementById('event-popup').classList.add('hidden');
    })
    .catch(error => console.log('Error registering for event:', error));
});
})  
