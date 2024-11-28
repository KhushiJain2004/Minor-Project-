$(document).ready(function () {
    const urlParams = new URLSearchParams(window.location.search);
    const clubId = urlParams.get('id');  // 'id' is the query parameter name

    console.log(clubId);

    fetch(`api/clubs?id=${clubId}`)
    .then(res=>res.json())
    .then(
        club=>{
            // console.log(club);
            document.getElementById("clubName").textContent=club.clubName;
            document.getElementById("description").textContent=club.description;
            document.getElementById("member1name").textContent=club.positionHolders[0].name;
            document.getElementById("member2name").textContent=club.positionHolders[1].name;
            document.getElementById("member3name").textContent=club.positionHolders[2].name;
            
            document.getElementById("member1designation").textContent=club.positionHolders[0].designation;
            document.getElementById("member2designation").textContent=club.positionHolders[1].designation;
            document.getElementById("member3designation").textContent=club.positionHolders[2].designation;
        }
    )
    .catch(error => console.error('Error fetching club details:', error));
});