$(document).ready(function()
{
    const club=JSON.parse(localStorage.getItem("club"));
    console.log(club);
    fetchEvents(club.clubId);
    const existingLinks=club.socialMediaLinks;
    populateSocialMediaLinks(existingLinks);
    function gatherFieldData(fieldName) {
        return Array.from(document.getElementsByName(fieldName))
          .map(input => input.value.trim())
          .filter(value => value);
      }
      
      function gatherSocialMediaLinks() {
        const keys = Array.from(document.getElementsByName("socialMediaKey"))
          .map(input => input.value.trim())
          .filter(value => value);
      
        const values = Array.from(document.getElementsByName("socialMediaValue"))
          .map(input => input.value.trim())
          .filter(value => value);
      
        const socialMediaLinks = {};
        keys.forEach((key, index) => {
          if (values[index]) {
            socialMediaLinks[key] = values[index];
          }
        });
      
        return socialMediaLinks; 
      }
      
      function gatherPositionHolders() {
        const positionHolders = [];
        // console.log(positionHolders.length);
        const fields = document.querySelectorAll(".positionHolderField");
        for (const field of fields) {
            const name = field.querySelector('input[name^="name"]').value.trim();
            const designation = field.querySelector('input[name^="designation"]').value.trim();
            
            if (!name || !designation) {
                toastr.options.positionClass = 'toast-bottom-right'; 
                toastr.options.zIndex = 999  ;
                toastr.warning("Incomplete fields for members");
                return []; 
            }
            
            positionHolders.push({ name, designation });
        }
          
      
        return positionHolders;
      }
      function handleEmptyFields(value) {
        return value.trim() === "" ? null : value.trim();
      }

    
      function collectFormData(e) {
        e.preventDefault();
        console.log("Submitted update");
      
        const data = {
            clubName: handleEmptyFields(document.getElementById("clubName").value),
            slogan: handleEmptyFields(document.getElementById("clubSlogan").value),
            description: handleEmptyFields(document.getElementById("clubDescription").value),
            contactEmail: handleEmptyFields(document.getElementById("contactEmail").value),
            contactPhone: handleEmptyFields(document.getElementById("contactPhone").value),
            memberBenefits: handleEmptyFields(document.getElementById("memberBenefits").value),
            memberFee: handleEmptyFields(document.getElementById("memberFee").value),
            achievements: gatherFieldData("achievements"),
            socialMediaLinks: gatherSocialMediaLinks(),
            positionHolders: gatherPositionHolders(), 
        };
      
        console.log(data);

      
        const adminId = JSON.parse(localStorage.getItem("user")).userId; 
      
        fetch(`/api/clubs?adminId=${adminId}`, {
          method: "PUT",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(data),
        })
          .then(response => {
            if (response.ok) {
              return response.json();
            } else {
            toastr.options.positionClass = 'toast-bottom-right';
              toastr.error("Failed to update the club.");
            }
          })
          .then(updatedClub => {
            console.log("Updated Club:", updatedClub);
            if(updatedClub!=null || updatedClub!=undefined )localStorage.setItem("club",JSON.stringify(updatedClub));
            toastr.options.positionClass = 'toast-bottom-right';
            toastr.success("Club updated successfully!");
          })
          .catch(error => console.error("Error:", error));
      }
      
      // Add Submit Button Listener
      document.getElementById("submitButton").addEventListener("click", collectFormData);
      
      // Add Event Listener to Close Modal When Clicking Outside
      document.getElementById("updateModal").addEventListener("click", event => {
        if (event.target.id === "updateModal") {
          document.getElementById("updateModal").style.display = "none";
        }
      });


      function populateSocialMediaLinks(existingLinks) {
        const container = document.getElementById("socialMediaContainer");
        container.innerHTML = ""; 
        for (const [key, value] of Object.entries(existingLinks)) {
          const div = document.createElement("div");
          div.className = "socialMediaField";
      
          const platformInput = document.createElement("input");
          platformInput.type = "text";
          platformInput.name = "socialMediaKey";
          platformInput.value = key;
          platformInput.placeholder = "Platform (e.g., Facebook)";
          div.appendChild(platformInput);
      
          const urlInput = document.createElement("input");
          urlInput.type = "text";
          urlInput.name = "socialMediaValue";
          urlInput.value = value;
          urlInput.placeholder = "URL (e.g., https://facebook.com)";
          div.appendChild(urlInput);
      
          const removeButton = document.createElement("button");
          removeButton.type = "button";
          removeButton.classList.add("removeButton");
          removeButton.textContent = '❌';
          removeButton.addEventListener("click", () => 
          { 
            urlInput.value="remove";
            urlInput.disabled=true;
            platformInput.disabled=true;
            //   container.removeChild(div);
            //   fetch(`/api/clubs/removeLink?adminId=${adminId}`,
            //   {
            //     method: "PUT",
            //     headers: { "Content-Type": "application/json" },
            //     body: JSON.stringify(data),
            //   })
          });

          div.appendChild(removeButton);
      
          container.appendChild(div);
        }
      }
      

      document.getElementById("createEvent").addEventListener("click", async (e) => {
        e.preventDefault();
        console.log("task ")
        const currentClub=JSON.parse(localStorage.getItem("club"));

        const eventData = {
          clubId: currentClub.clubId, 
          eventName: document.getElementById("taskInput").value.trim(),
          eventDescription: document.getElementById("eventDescription").value.trim(),
          startTime: new Date(
            document.getElementById("dateFrom").value + "T" + document.getElementById("clockStart").value
          ).toISOString(),
          endTime: new Date(
            document.getElementById("dateTo").value + "T" + document.getElementById("clockEnd").value
          ).toISOString(),
          contact: {
            name: document.getElementById("eventManager").value.trim(),
            email: document.getElementById("contactEmail").value.trim(),
          },
          featured: document.getElementById("featuredEvent").checked, 
          tags: getSelectedTags(), 
        };
      
        try {
          const response = await fetch("../api/events", {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify(eventData),
          });
      
          if (response.ok) {
            const savedEvent = await response.json();
            toastr.success("Event created successfully!");
            console.log("Saved Event:", savedEvent);
            document.getElementById("taskModal").style.display="none";
            fetchEvents(currentClub.clubId);
          } else {
            const error = await response.json();
            toastr.error("Failed to create event: " + error.message);
            console.error("Error response:", error);
          }
        } catch (err) {
          toastr.error("An error occurred: " + err.message);
          console.error(err);
        }
      });

      function getSelectedTags() {
        const selectedTags = [];
        const tagCheckboxes = document.querySelectorAll('#tagsDropdown input[type="checkbox"]:checked');
        tagCheckboxes.forEach((checkbox) => {
          selectedTags.push(checkbox.value);
        });
        return selectedTags;
      }
      
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

    

   

});
function render(events, clubId) {
  const ongoing = document.getElementById("ongoing");
  const upcoming = document.getElementById("upcoming");
  const featured = document.getElementById("featured");
  const now = Date.now();

  ongoing.innerHTML = '';
  upcoming.innerHTML = '';
  featured.innerHTML = '';

  events.forEach(event => {
    console.log(event);
    const eventCard = document.createElement('div');
    eventCard.classList.add("event-card");

    eventCard.innerHTML = `
      <div class="eventInfoContainer">
          <div class="event-description">${event.eventName}</div>          
          <div class="event-description">${event.eventDescription}</div>          
      </div>
    `;

    console.log(eventCard);

    if (new Date(event.startTime) <= now && new Date(event.endTime) >= now) {
      ongoing.appendChild(eventCard);
    } else if (new Date(event.startTime) > now) {
      upcoming.appendChild(eventCard);
    }

    if (event.featured) {
      const clonedElement = eventCard.cloneNode(true);
      featured.appendChild(clonedElement);
    }
  });
}


