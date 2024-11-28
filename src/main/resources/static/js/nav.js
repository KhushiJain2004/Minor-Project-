// Fetch the list of clubs and populate the dropdown
document.addEventListener("DOMContentLoaded", function() {
    const clubDropdownList = document.getElementById('club-dropdown-list');

    // Fetch clubs from the server (make sure to replace with your actual API endpoint)
    fetch('/api/clubs/list')
        .then(response => response.json())
        .then(clubs => {
            // Loop through the clubs and add them to the dropdown list
            clubs.forEach(club => {
                // console.log(club);
                const clubItem = document.createElement('li');
                const clubLink = document.createElement('a');
                clubLink.href = `/clubs?id=${club.clubId}`;  // Assuming you want to link to a page for each club
                clubLink.textContent = club.clubName;
                clubItem.appendChild(clubLink);
                clubDropdownList.appendChild(clubItem);
            });
        })
        .catch(error => {
            console.error('Error fetching clubs:', error);
        });
});
