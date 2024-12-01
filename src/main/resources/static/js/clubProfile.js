$(document).ready(function () {
    const urlParams = new URLSearchParams(window.location.search);
    const clubId = urlParams.get('id');  // 'id' is the query parameter name
    fetchEvents(clubId);
    var clubName = "";

    console.log(clubId);

    fetch(`api/clubs?id=${clubId}`)
        .then(res => res.json())
        .then(
            club => {
                console.log(club);
                clubName = club.clubName;
                document.getElementById("clubName").textContent = club.clubName;
                document.getElementById("slogan").textContent = club.slogan;
                document.getElementById("description").textContent = club.description;
                document.getElementById("achievements").textContent = "";
                
                club.achievements.forEach(achievement => {
                    const li = document.createElement('li');
                    li.style.listStyleType="none";
                    li.textContent = achievement;
                    document.getElementById("achievements").appendChild(li);
                });

                document.getElementById("membership").textContent = club.memberBenefits;
                document.getElementById("member1name").textContent = club.positionHolders[0].name;
                document.getElementById("member2name").textContent = club.positionHolders[1].name;
                document.getElementById("member3name").textContent = club.positionHolders[2].name;

                document.getElementById("member1designation").textContent = club.positionHolders[0].designation;
                document.getElementById("member2designation").textContent = club.positionHolders[1].designation;
                document.getElementById("member3designation").textContent = club.positionHolders[2].designation;

                Object.keys(club.socialMediaLinks).forEach(site => {
                    const link = document.getElementById(site);
                    if (link) {
                        if(site=='email') link.href=`mailto:${club.socialMediaLinks.email}`;
                        else link.href = club.socialMediaLinks[site];
                    }
                });
            }
        )
        .catch(error => console.error('Error fetching club details:', error));

    function fetchEvents(clubId) {
        fetch(`/api/events/club/${clubId}`)
            .then(response => {
                if (response.ok) {
                    return response.json(); // Parse the JSON data if successful
                } else if (response.status === 204) {
                    // Handle empty events response (No content)
                    console.log('No events available for this club.');
                    return [];
                } else {
                    throw new Error('Failed to load events');
                }
            })
            .then(events => {
                // Call a function to render events
                console.log(events);
                render(events, clubId);
            })
            .catch(error => console.log('Error fetching events:', error));
    }

    function render(events, clubId) {
        const ongoing = document.getElementById("ongoing");
        const upcoming = document.getElementById("upcoming");
        const featured = document.getElementById("featured");
        const now = Date.now();

        events.forEach(event => {
            const eventCard = document.createElement('div');
            eventCard.classList.add("event-card");

            eventCard.innerHTML = `
                <div class="eventInfoContainer">
                    <div class="event-description">${event.eventName}</div>
                <button class="read-more-btn" onclick="openEventPopup('${event.id}')">Read More</button>
                </div>
            `;

            if (new Date(event.startTime) <= now && new Date(event.endTime) >= now) {
                ongoing.append(eventCard);
            } else if (new Date(event.startTime) > now) {
                upcoming.append(eventCard);
            }

            if (event.featured) {
                const clonedElement = eventCard.cloneNode(true);
                featured.appendChild(clonedElement);
            }
        });
    }

    window.openEventPopup = function (eventId) {
        fetch(`/api/events/${eventId}`)
            .then(response => response.json())
            .then(event => {
                console.log(event);

                // Set popup visibility
                document.getElementById("event-popup").style.display = "flex";

                // Update popup content
                document.querySelector('.popup-info h3').textContent = event.eventName;
                document.querySelector('.popup-logo h3').textContent = clubName;     
                document.querySelector('.popup-info p').textContent = event.eventDescription;
                document.getElementById('startDate').textContent = formatDateTime(event.startTime);
                document.getElementById('endDate').textContent = formatDateTime(event.endTime); 
                document.getElementById('contactName').textContent = event.contact.name; 
                document.getElementById('contactEmail').textContent = event.contact.email; 

                document.getElementById('event-popup').classList.remove('hidden');
            })
            .catch(error => console.log('Error fetching event details:', error));
    }

    document.getElementById("event-popup").addEventListener('click', function (e) {
        if (e.target === document.getElementById("event-popup")) {
            document.getElementById("event-popup").style.display = "none";
        }
    });
    function formatDateTime(dateTime) {
        const dateObj = new Date(dateTime);
        const options = {
            year: "numeric",
            month: "long",
            day: "numeric",
            hour: "numeric",
            minute: "numeric",
            hour12: true
        };
        return dateObj.toLocaleString("en-US", options);
    }
});
