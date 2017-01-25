function removeAthlete(element) {
    $.ajax({
        type: "POST",
        url: "/users/" + element.getAttribute("data") + "/unsave_athlete",
        data: {
            user_id: (element.getAttribute("data")),
            athlete_profile: (element.getAttribute("athlete_profile_id"))
        }
    }).done(function() {
        $(element).html("<i class='fa fa-plus'>Save athlete</i>");
        $(element).attr('onclick', 'saveAthlete(this)');
    });
}

function saveAthlete(element) {
    $.ajax({
        type: "POST",
        url: "/users/" + element.getAttribute("data") + "/save_athlete",
        data: {
            user_id: (element.getAttribute("data")),
            athlete_profile: (element.getAttribute("athlete_profile_id"))
        }
    }).done(function() {
        $(element).html("<i class='fa fa-times'>Remove athlete</i>");
        $(element).attr('onclick', 'removeAthlete(this)');
    });
}

function trackTeamClick(count, id) {
    if (count >= 1) {
        $('.green-circle').hide();
        $.ajax({
            type: "POST",
            url: "/teams/update_notifications",
            data: {id: id }
        })
    }
}
