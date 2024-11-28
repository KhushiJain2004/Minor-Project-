$(document).ready(function()
{
    const club=JSON.parse(localStorage.getItem("club"));
    console.log(club);
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
        // if (positionHolders.length <3 && positionHolders.length>0) {
        //     toastr.options.positionClass = 'toast-bottom-right';
        //     toastr.warning("Please fill in all position holder details or leave them blank.");
        //     return; 
        //   }
        // else if(positionHolders.length ==0) return positionHolders;
          
      
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
          removeButton.textContent = "Remove";
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
      
      
})