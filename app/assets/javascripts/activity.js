function unlikeActivity(element) {
    $.ajax({
        type: "POST",
        url: "/users/" + element.getAttribute("data") + "/unlike_activity",
        data: {
            user_id: (element.getAttribute("data")),
            activity: (element.getAttribute("activity_id"))
        }
    }).done(function() {
        $(element).html("<i class='fa fa-thumbs-up'>Like</i>");
        $(element).attr('onclick', 'likeActivity(this)');
    });
}

function likeActivity(element) {
    $.ajax({
        type: "POST",
        url: "/users/" + element.getAttribute("data") + "/like_activity",
        data: {
            user_id: (element.getAttribute("data")),
            activity: (element.getAttribute("activity_id"))
        }
    }).done(function() {
        $(element).html("<i class='fa fa-thumbs-down'>Unlike</i>");
        $(element).attr('onclick', 'unlikeActivity(this)');
    });
}
