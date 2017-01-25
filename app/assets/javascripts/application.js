// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require html.sortable
//= require best_in_place
//= require jquery-ui
//= require jquery-ui/autocomplete
//= require best_in_place.jquery-ui
//= require bootstrap-sprockets
//= require turbolinks
//= require cocoon
//= require athlete_profile
//= require college_teams
//= require rate_athletes
//= require js.cookie
//= require star-rating
//= require teams
//= require activity
//= require autocomplete-rails
//= require jquery-ui-touch-punch
//= require turbolinks

var ready = function() {
    /* Start basic info button active */
    $('#athlete-prof-basic-info').show();
    $('#athlete-basic-info-btn').addClass("active");
};

$(document).ready(ready);
$(document).on('page:change', ready);

$(document).ready(function() {

    // this handles the users/:id/new_coach validation
    $('.verification-btn').click(function() {
        if ($('#college_id').val().length == 0 || $('#college_email_address').val().length == 0) {
            alert("You must fill out all fields to continue");
        }
    });

    // this handles the char count on the athlete newsfeed
    var review_text = $("#media_comment");
    var counter     = $("#counter");
    var max_length  = counter.data("maximum-length");

    review_text.keyup(function() {
        counter.text(max_length - $(this).val().length);
    });


    // This handles the star ratings
    $(".rating").rating({showCaption: false, showClear: false});

    $('.rating').on('rating.change', function(event, value, caption) {

        $.ajax({
            type: "POST",
            url: "/athlete_profiles/register_rating",
            data: {
                id: (this.getAttribute("data")),
                rating: value,
                user_id: this.getAttribute("user_id")
            }
        }).done(function() {
            // Nothing for now
            var width;
            if (value == 0.5) {
                width = "10%";
            } else if (value == 1) {
                width = "20%";
            } else if (value == 1.5) {
                width = "30%";
            } else if (value == 2) {
                width = "40%";
            } else if (value == 2.5) {
                width = "50%";
            } else if (value == 3) {
                width = "60%";
            } else if (value == 3.5) {
                width = "70%";
            } else if (value == 4) {
                width = "80%";
            } else if (value == 4.5) {
                width = "90%";
            } else if (value == 5) {
                width = "100%";
            }
        })
    });

    set_star_ratings();


    // This handles the ranking of athletes on the college coach side of the application

    set_positions();
    $('.sortable').sortable();

    $('.sortable').sortable().bind('sortupdate', function(e, ui) {
        updated_order = [];

        set_positions();

        $('.panel.panel-default').each(function(i){
            updated_order.push({id: $(this).data("id"), position: i+1});
        });

        $.ajax({
            type: "PUT",
            url: '/users/sort',
            data: { order: updated_order }
        });
    });

    // This handles the ranking of team on the athlete_profiles side of the application
    $('.team-sortable').sortable();
    $('.team-sortable').sortable().bind('sortupdate', function(e, ui) {
        updated_order = [];

        set_positions();

        var athlete_profile = $(this).data("athlete-profile");

        console.log(athlete_profile);

        $('.panel.panel-default').each(function(i) {
            updated_order.push({id: $(this).data("id"), position: i+1});
        });

        $.ajax({
            type: "PUT",
            url: '/athlete_profiles/' + athlete_profile + '/interests/sort',
            data: { order: updated_order}
        });
    });
/*
    $('#experiences-div').on('cocoon:before-insert', function(e, insertedItem) {
        var stat_select = insertedItem.find('.stat-select');
        var sport = $('.sport-select').val();
        set_statistics_for_experience(sport, stat_select);
    });*/

/*    $('#progressive-experiences-div').on('cocoon:before-insert', function(e, insertedItem) {

        var stat_select = insertedItem.find('.stat-select')
        var sport = $('.sport-select').val();
        set_statistics_for_experience(sport, stat_select);
    });*/

/*    $('#stats-div').on('cocoon:before-insert', function(e, insertedItem) {
       var sport = $('.sport-select').val();
       var stat_select = insertedItem.find('.stat-select');
       set_statistics_for_experience(sport, stat_select);
    });

    $('#stats-div-progressive').on('cocoon:before-insert', function(e, insertedItem) {
        var sport = $('.sport-select').val();
        var stat_select = insertedItem.find('.stat-select');
        set_statistics_for_experience(sport, stat_select);
    });*/


    // We don't want to show the navbar on the twitter player card page because it shows up in the image that is auto-created
    if (window.location.href.indexOf("twitter_player_card") > -1) {
        $('.navbar').hide();
    }

    $('.pagination a').click(function() {
        location.reload();
    });

    $('#search_preference').change(function() {
        if($('#search_preference').val() == "Teams") {
            $('.team-search-div').show();
            $('.athlete-search-div').hide();
        } else if ($('#search_preference').val() == "Athletes") {
            $('.team-search-div').hide();
            $('.athlete-search-div').show();
        }
    });

    $('#new_athlete_profile').on('keyup keypress', function(e) {
        var keyCode = e.keyCode || e.which;
        if (keyCode === 13) {
            e.preventDefault();
            return false;
        }
    });

    $('.invite-teammates-btn').click(function() {
        if ($('.invite-div').css("display") == 'none') {
            $('.invite-div').show();
        } else {
            $('.invite-div').hide();
        }
    });

    $('.promote-me-btn').click(function() {
        if ($('.promote-me-div').css("display") == 'none') {
            $('.promote-me-div').show();
            $('.browse-teams-btn').css("height", "470px");
        } else {
            $('.promote-me-div').hide();
            $('.browse-teams-btn').css("height", "130px");
        }
    });

    $('#refresh-rankings').click(function() {
       location.reload();
    });

    $('.team-rank').change(function() {

        var athlete_id = $(this).data("athleteId");

        if (athlete_id != undefined) {
            $.ajax({
                type: "POST",
                url: "/athlete_profiles/" + athlete_id + "/interests/update_row_order",
                data: {
                    interest_id: $(this).data("interestId"),
                    row_position: $(this).val(),
                    athlete_id: athlete_id
                }
            })
        }
    });

    athlete_mobile_progressive_profiling();
    athlete_progressive_profiling();


    register_athlete_prof_button_clicks();
    register_progressive_profiling_clicks();
    register_progressive_profiling_skip_btns();
    register_sport_division_changes();
    register_standout_challenge_clicks();
});

set_positions = function() {
    $('.panel.panel-default').each(function(i){
        $(this).attr("data-pos", i+1);
    });
};

function register_standout_challenge_clicks() {
    $('#challenge-step-two').click(function() {
        Cookies.set('challenge_step', 2 );
    });

    $('#challenge-step-three').click(function() {
        Cookies.set('challenge_step', 3 );
    });

    $('#challenge-step-four').click(function() {
        Cookies.set('challenge_step', 4 );
    });

    $('#challenge-step-five').click(function() {
        Cookies.set('challenge_step', 5 );
    });

    $('#challenge-step-six').click(function() {
        Cookies.set('challenge_step', 6 );
    });

    $('#challenge-step-seven').click(function() {
        Cookies.set('challenge_step', 7 );
    });

    $('#challenge-step-eight').click(function() {
        Cookies.set('challenge_step', 8 );
    });

    $('#profile-strength-challenge').click(function() {
       Cookies.set('challenge_step', 8.5);
    });

    $('#challenge-step-nine').click(function() {
        Cookies.set('challenge_step', 9 );
    });

    $('#challenge-step-ten').click(function() {
        Cookies.set('challenge_step', 10 );
    });

    $('#challenge-step-eleven').click(function() {
        Cookies.set('challenge_step', 11 );
    });

    $('#challenge-step-twelve').click(function() {
        Cookies.set('challenge_step', 12 );
    });

    $('#challenge-step-thirteen').click(function() {
        Cookies.set('challenge_step', 13 );
    });

    $('#challenge-step-fourteen').click(function() {
        Cookies.set('challenge_step', 14 );
    });

    $('#challenge-step-fifteen').click(function() {
        Cookies.set('challenge_step', 15 );
    });

    $('#challenge-step-sixteen').click(function() {
        Cookies.set('challenge_step', 16 );
    });

    $('#challenge-step-seventeen').click(function() {
        Cookies.set('challenge_step', 17 );
    });

    $('#challenge-step-eighteen').click(function() {
        Cookies.set('challenge_step', 18 );
    });

    $('.finish-challenge-btn').click(function() {
        $.ajax({
            type: "POST",
            url: "/athlete_profiles/update_bronze_challenge",
            data: {
                athlete_profile: $(this).data("athlete-profile")
            }
        }).done(function() {
            // Do nothing
        });
    });

    $('.stand-out-challenge-btn').click(function() {
        var cookie_step = Cookies.get('challenge_step');
        var athlete_id = $(this).data("athlete-profile");
        console.log(cookie_step);
        console.log(athlete_id);
        if (cookie_step == "2") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_two")
        } else if (cookie_step == "3") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_three")
        } else if (cookie_step == "4") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_four")
        } else if (cookie_step == "5") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_five")
        } else if (cookie_step == "6") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_six")
        } else if (cookie_step == "7") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_seven")
        } else if (cookie_step == "8") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/interests")
        } else if (cookie_step == "8.5") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_eight")
        } else if (cookie_step == "9") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_nine")
        } else if (cookie_step == "10") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_ten")
        } else if (cookie_step == "11") {
            console.log("here")
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_eleven")
        } else if (cookie_step == "12") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_twelve")
        } else if (cookie_step == "13") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_thirteen")
        } else if (cookie_step == "14") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_fourteen")
        } else if (cookie_step == "15") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_fifteen")
        } else if (cookie_step == "16") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_sixteen")
        } else if (cookie_step == "17") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_seventeen")
        } else if (cookie_step == "18") {
            window.location.replace("/athlete_profiles/" + athlete_id + "/challenge_step_eighteen")
        }
    });

}

function registerInterest(element) {
    $.ajax({
        type: "POST",
        url: "/athlete_profiles/" + element.getAttribute("athlete_profile") + "/express_interest",
        data: {
            team_id: (element.getAttribute("data")),
            athlete_profile: (element.getAttribute("athlete_profile"))
        }
    }).done(function() {
        $(element).removeClass('submit-interest-btn');
        $(element).addClass('remove-interest-btn');
        $(element).html("Remove Interest");
        $(element).attr('onclick', 'removeInterest(this)');
    });
}

function removeInterest(element) {
    $.ajax({
        type: "POST",
        url: "/athlete_profiles/" + element.getAttribute("athlete_profile") + "/remove_interest",
        data: {
            team_id: (element.getAttribute("data")),
            athlete_profile: (element.getAttribute("athlete_profile"))
        }
    }).done(function() {
        $(element).removeClass('remove-interest-btn');
        $(element).addClass('submit-interest-btn');
        $(element).html("Express Interest");
        $(element).attr('onclick', 'registerInterest(this)');
    });
}

function registerInterestChallenge(element) {
    $.ajax({
        type: "POST",
        url: "/athlete_profiles/" + element.getAttribute("athlete_profile") + "/express_interest",
        data: {
            team_id: (element.getAttribute("data")),
            athlete_profile: (element.getAttribute("athlete_profile"))
        }
    }).done(function() {
        $(element).html("<span style='color:lightgray;'><i class='fa fa-times'></i> remove</span>");
        $(element).attr('onclick', 'removeInterestChallenge(this)');
    });
}

function removeInterestChallenge(element) {
    $.ajax({
        type: "POST",
        url: "/athlete_profiles/" + element.getAttribute("athlete_profile") + "/remove_interest",
        data: {
            team_id: (element.getAttribute("data")),
            athlete_profile: (element.getAttribute("athlete_profile"))
        }
    }).done(function() {
        $(element).html("<i class='fa fa-plus'></i>");
        $(element).attr('onclick', 'registerInterestChallenge(this)');
    });
}


function registerFollow(element) {
    $.ajax({
        type: "POST",
        url: "/athlete_profiles/" + element.getAttribute("athlete_profile") + "/follow_team",
        data: {
            team_id: (element.getAttribute("data")),
            athlete_profile: (element.getAttribute("athlete_profile"))
        }
    }).done(function() {
        $(element).removeClass('follow-team-btn');
        $(element).addClass('unfollow-team-btn');
        $(element).html("Unfollow Team");
        $(element).attr('onclick', 'removeFollow(this)');
    });
}

function removeFollow(element) {
    $.ajax({
        type: "POST",
        url: "/athlete_profiles/" + element.getAttribute("athlete_profile") + "/unfollow_team",
        data: {
            team_id: (element.getAttribute("data")),
            athlete_profile: (element.getAttribute("athlete_profile"))
        }
    }).done(function() {
        $(element).addClass('follow-team-btn');
        $(element).removeClass('unfollow-team-btn');
        $(element).html("Follow Team");
        $(element).attr('onclick', 'registerFollow(this)');
    });
}



function requestFeedback(element) {
    $.ajax({
       type: "POST",
       url: "/athlete_profiles/request_additional_feedback",
       data: {
            athlete_profile: (element.getAttribute("athlete-profile")),
            sport: (element.getAttribute("sport"))
        }
    }).done(function() {
        alert("Thanks!  We've requested feedback")
    });
}

function requestBylPromotion(element) {
    $.ajax({
        type: "POST",
        url: "/athlete_profiles/" + element.getAttribute("athlete-profile") + "/request_community_promotion",
        data: {
            athlete_profile: (element.getAttribute("athlete-profile"))
        }
    }).done(function() {
        alert("Thanks!  We've requested community promotion")
    });
}

function register_progressive_profiling_skip_btns() {
    $('#skip-skill').click(function() {
       $('#progressive-skills').hide();
       $('#progressive-coaches').show();
    });

    $('#skip-coach').click(function() {
        $('#progressive-coaches').hide();
        $('#progressive-guardian').show();
    });

    $('#skip-guardian').click(function() {
        $('#progressive-form').hide();
    });

    $('#skip-gpa').click(function() {
        $('#progressive-gpa').hide();
        $('#progressive-test-scores').show();
    });

    $('#skip-academics-sat').click(function() {
        $('#progressive-video-highlights').show();
        $('#progressive-test-scores').hide();
    });

    $('#skip-academics-act').click(function() {
        $('#progressive-video-highlights').show();
        $('#progressive-test-scores').hide();
    });

    $('#skip-video').click(function() {
        $('#progressive-video-highlights').hide();

        if ( $('#progressive-skills').children().length == 0 ) {
            $('#progressive-coaches').show();
        } else {
            $('#progressive-skills').show();
        }
    });

    $('#skip-skill-mobile').click(function() {
        $('#progressive-skills-mobile').hide();
        $('#progressive-coaches-mobile').show();
    });

    $('#skip-coach-mobile').click(function() {
        $('#progressive-coaches-mobile').hide();
        $('#progressive-guardian-mobile').show();
    });

    $('#skip-guardian-mobile').click(function() {
        $('#progressive-form-mobile').hide();
    });

    $('#skip-gpa-mobile').click(function() {
        $('#progressive-gpa-mobile').hide();
        $('#progressive-test-scores-mobile').show();
    });

    $('#skip-academics-sat-mobile').click(function() {
        $('#progressive-video-highlights-mobile').show();
        $('#progressive-test-scores-mobile').hide();
    });

    $('#skip-academics-act-mobile').click(function() {
        $('#progressive-video-highlights-mobile').show();
        $('#progressive-test-scores-mobile').hide();
    });

    $('#skip-video-mobile').click(function() {
        $('#progressive-video-highlights-mobile').hide();

        if ( $('#progressive-skills-mobile').children().length == 0 ) {
            $('#progressive-coaches-mobile').show();
        } else {
            $('#progressive-skills-mobile').show();
        }
    });
}

function athlete_mobile_progressive_profiling() {
    // Step one, progressive - GPA
    if ($('#progressive-gpa-mobile').css("display") == 'none') {
        $('#progressive-video-highlights-mobile').css("display", "none");
        $('#progressive-skills-mobile').css("display", "none");
        $('#progressive-coaches-mobile').css("display", "none");
        $('#progressive-guardian-mobile').css("display", "none");
    } else {
        $('#progressive-test-scores-mobile').css("display", "none");
        $('#progressive-video-highlights-mobile').css("display", "none");
        $('#progressive-skills-mobile').css("display", "none");
        $('#progressive-coaches-mobile').css("display", "none");
        $('#progressive-guardian-mobile').css("display", "none");
    }

    // Step two, progressive - SAT test scores
    if ($('#progressive-gpa-mobile').css("display") == 'none' && $('#progressive-test-scores-mobile').css("display") == 'none') {
        $('#progressive-video-highlights-mobile').show();
        $('#progressive-skills-mobile').css("display", "none");
        $('#progressive-coaches-mobile').css("display", "none");
        $('#progressive-guardian-mobile').css("display", "none");
    }

    // Step three, progressive - Video highlights
    if ($('#progressive-gpa-mobile').css("display") == 'none' && $('#progressive-test-scores-mobile').css("display") == 'none' && ($('#progressive-video-highlights-mobile').length == 0)) {
        $('#progressive-skills-mobile').show();
    }

    // Step four, progressive - Skills
    if ($('#progressive-gpa-mobile').css("display") == 'none' && $('#progressive-test-scores-mobile').css("display") == 'none' && ($('#progressive-video-highlights-mobile').length == 0) && $('#progressive-skills-mobile').children().length == 0) {
        $('#progressive-coaches-mobile').show();
    }

    // Step five, progressive - Guardian
    if ($('#progressive-gpa-mobile').css("display") == 'none' && $('#progressive-test-scores-mobile').css("display") == 'none' && ($('#progressive-video-highlights-mobile').length == 0) && $('#progressive-skills-mobile').children().length == 0 && $('#progressive-coaches-mobile').children().length == 0) {
        $('#progressive-guardian-mobile').show();
    }

    // Step five, progressive - Guardian
    if ($('#progressive-gpa-mobile').css("display") == 'none' && $('#progressive-test-scores-mobile').css("display") == 'none' && ($('#progressive-video-highlights-mobile').length == 0) && $('#progressive-skills-mobile').children().length == 0 && $('#progressive-coaches-mobile').children().length == 0 && $('#athlete_profile_guardian_first_name').val().length > 1) {
        $('#progressive-guardian-mobile').hide();
    }

}

function athlete_progressive_profiling() {
    // Step one, progressive - GPA
    if ($('#progressive-gpa').css("display") == 'none') {
        $('#progressive-video-highlights').css("display", "none");
        $('#progressive-skills').css("display", "none");
        $('#progressive-coaches').css("display", "none");
        $('#progressive-guardian').css("display", "none");
    } else {
        $('#progressive-test-scores').css("display", "none");
        $('#progressive-video-highlights').css("display", "none");
        $('#progressive-skills').css("display", "none");
        $('#progressive-coaches').css("display", "none");
        $('#progressive-guardian').css("display", "none");
    }

    // Step two, progressive - SAT test scores
    if ($('#progressive-gpa').css("display") == 'none' && $('#progressive-test-scores').css("display") == 'none') {
        $('#progressive-video-highlights').show();
        $('#progressive-skills').css("display", "none");
        $('#progressive-coaches').css("display", "none");
        $('#progressive-guardian').css("display", "none");
    }

    // Step three, progressive - Video highlights
    if ($('#progressive-gpa').css("display") == 'none' && $('#progressive-test-scores').css("display") == 'none' && ($('#progressive-video-highlights').length == 0)) {
        $('#progressive-skills').show();
    }

    // Step four, progressive - Skills
    if ($('#progressive-gpa').css("display") == 'none' && $('#progressive-test-scores').css("display") == 'none' && ($('#progressive-video-highlights').length == 0) && $('#progressive-skills').children().length == 0) {
        $('#progressive-coaches').show();

    }

    // Step five, progressive - Guardian
    if ($('#progressive-gpa').css("display") == 'none' && $('#progressive-test-scores').css("display") == 'none' && ($('#progressive-video-highlights').length == 0) && $('#progressive-skills').children().length == 0 && $('#progressive-coaches').children().length == 0) {
        $('#progressive-guardian').show();
    }

    // Step five, progressive - Guardian
    if ($('#progressive-gpa').css("display") == 'none' && $('#progressive-test-scores').css("display") == 'none' && ($('#progressive-video-highlights').length == 0) && $('#progressive-skills').children().length == 0 && $('#progressive-coaches').children().length == 0 && $('#athlete_profile_guardian_first_name').val().length > 1) {
        $('#progressive-guardian').hide();
    }

}

// This function figures out if the user has rated the athlete, and if so, fills in the right number of stars
function set_star_ratings() {
    // Grab one of the star elements so we can get the athlete_profile and user_id attributes
    var star = $('.rating-attributes')[0];

    if (star == undefined) {

    } else {

        $.ajax({
            type: "POST",
            url: "/athlete_profiles/check_ratings",
            data: {
                athlete_profile: star.getAttribute("athlete_profile"),
                user_id: star.getAttribute("user_id")
            },
            success: function (result) {

                $.each(result, function(index,value) {
                    // Nothing for now
                    var width;
                    if (value == 0.5) {
                        width = "10%";
                    } else if (value == 1) {
                        width = "20%";
                    } else if (value == 1.5) {
                        width = "30%";
                    } else if (value == 2) {
                        width = "40%";
                    } else if (value == 2.5) {
                        width = "50%";
                    } else if (value == 3) {
                        width = "60%";
                    } else if (value == 3.5) {
                        width = "70%";
                    } else if (value == 4) {
                        width = "80%";
                    } else if (value == 4.5) {
                        width = "90%";
                    } else if (value == 5) {
                        width = "100%";
                    }
                    $('.filled-stars').width(width)
                });

            }
        }).done(function () {
            // Maybe do something here sometime.
        });
    }
}


function set_statistics_for_experience(el, stat_select) {
    stat_select.empty();

    if (el == "Football (American)") {
        $.each(footballStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Baseball") {
        $.each(baseballStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Archery") {
        $.each(archeryStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Badminton") {
        $.each(badmintonStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Basketball (Female)") {
        $.each(basketballStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Basketball (Male)") {
        $.each(basketballStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Bowling (Female)") {
        $.each(bowlingStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Bowling (Male)") {
        $.each(bowlingStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Cheerleading") {
        $.each(cheerleadingStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Cricket") {
        $.each(cricketStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Cross Country (Female)") {
        $.each(crosscountryStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Cross Country (Male)") {
        $.each(crosscountryStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Equestrian-Riding") {
        $.each(equestrianridingStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Fencing") {
        $.each(fencingStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Field Hockey (Female)") {
        $.each(fieldhockeyStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Field Hockey (Male)") {
        $.each(fieldhockeyStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Fishing") {
        $.each(fishingStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Golf (Female)") {
        $.each(golfStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Golf (Male)") {
        $.each(golfStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Gymnastics") {
        $.each(gymnasticsStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Handball") {
        $.each(handballStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Golf (Female)") {
        $.each(golfStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Ice Hockey (Female)") {
        $.each(icehockeyStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Ice Hockey (Male)") {
        $.each(icehockeyStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Lacrosse (Female)") {
        $.each(lacrosseStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Lacrosse (Male)") {
        $.each(lacrosseStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Motorsports") {
        $.each(motorsportsStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Rifle (Female)") {
        $.each(rifleStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Rifle (Male)") {
        $.each(rifleStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Rodeo") {
        $.each(rodeoStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Rowing - Crew") {
        $.each(rowingStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Rugby") {
        $.each(rugbyStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Sailing") {
        $.each(sailingStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Skiing") {
        $.each(skiingStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Rifle (Female)") {
        $.each(rifleStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Soccer (Female)") {
        $.each(soccerStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Soccer (Male)") {
        $.each(soccerStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Softball") {
        $.each(baseballStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Squash (Female)") {
        $.each(squashStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Squash (Male)") {
        $.each(squashStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Swimming - Diving (Female)") {
        $.each(swimmingStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Swimming - Diving (Male)") {
        $.each(swimmingStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Tennis (Female)") {
        $.each(tennisStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Tennis (Male)") {
        $.each(tennisStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Track and Field (Female)") {
        $.each(trackandfieldStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Track and Field (Male)") {
        $.each(trackandfieldStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Volleyball (Female)") {
        $.each(volleyballStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Water Polo (Male)") {
        $.each(waterpoloStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Wrestling") {
        $.each(wrestlingStats, function (key, value) {
            $(stat_select).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    }
}

function turn_off_basic_buttons() {
    $('#athlete-basic-info-btn').removeClass("active");
    $('#athlete-prof-basic-info').hide();
}

function trackClick(count, id) {
    if (count >= 1) {
      $('.green-circle').hide();
        $.ajax({
            type: "POST",
            url: "/athlete_profiles/update_notifications",
            data: {id: id }
        })
    }
}

function register_progressive_profiling_clicks() {

    $('#step-one').click(function () {
        if (!$("input[name='athlete_profile[gender]']:checked").val()){
            alert('You must select a gender');
        } else {
            $('.profile-step-one').hide();
            $('#step-one').hide();
            $('.profile-step-two').show();
            $('#step-two').show();
            Cookies.set('gender', $("input[name='athlete_profile[gender]']:checked").val(), { expires: 1});
            window.history.pushState(null, null, '?step_two')
        }
    });

    $('#step-two').click(function() {
        if ($('#athlete_profile_city').val().length == 0 || $('#athlete_profile_zipcode').val().length == 0) {
            alert("You must enter all fields to continue")
        } else {
            $('.profile-step-two').hide();
            $('#step-two').hide();
            $('.profile-step-three').show();
            $('#step-three').show();
            Cookies.set('city', $('#athlete_profile_city').val(), { expires: 1});
            Cookies.set('state', $('#athlete_profile_state').val(), { expires: 1});
            Cookies.set('zipcode', $('#athlete_profile_zipcode').val(), { expires: 1});
            Cookies.set('country', $('#athlete_profile_country').val(), { expires: 1});
            window.history.pushState(null, null, '?step_three')
        }
    });

    $('#step-three').click(function() {
        $('.profile-step-three').hide();
        $('#step-three').hide();
        $('.profile-step-four').show();
        $('#step-four').show();
        Cookies.set('height_feet', $('#athlete_profile_height_feet').val(), { expires: 1});
        Cookies.set('height_inches', $('#athlete_profile_height_inches').val(), { expires: 1});
        Cookies.set('weight', $('#athlete_profile_weight').val(), { expires: 1});
        window.history.pushState(null, null, '?step_four')

    });

    $('#step-four').click(function() {
        $('.profile-step-four').hide();
        $('#step-four').hide();
        $('.profile-step-five').show();
        $('#step-five').show();
        Cookies.set('birth_yr', $('#athlete_profile_birthday_1i').val(), { expires: 1});
        Cookies.set('birth_month', $('#athlete_profile_birthday_2i').val(), { expires: 1});
        Cookies.set('birth_day', $('#athlete_profile_birthday_3i').val(), { expires: 1});
        window.history.pushState(null, null, '?step_five')
    });

    $('#step-five').click(function() {
        if ($('#athlete_profile_school_name').val().length == 0) {
            alert("You must enter all fields to continue")
        } else {
            $('.profile-step-five').hide();
            $('#step-five').hide();
            $('.profile-step-seven').show();
            $('.submit-create').show();
            Cookies.set('school_name', $('#athlete_profile_school_name').val(), { expires: 1});
            Cookies.set('grad_yr', $('#athlete_profile_graduation_year').val(), { expires: 1});
            window.history.pushState(null, null, '?step_six')
        }
    });

    $('#step-six').click(function() {
        if ($('#athlete_profile_primary_phone').val().length == 0) {
            alert("You must enter all fields to continue")
        } else {
            $('.profile-step-six').hide();
            $('#step-six').hide();
            $('.profile-step-seven').show();
            $('#step-seven').show();
            Cookies.set('phone', $('#athlete_profile_primary_phone').val(), { expires: 1});
            Cookies.set('phone_type', $('#athlete_profile_primary_phone_type').val(), { expires: 1});
            window.history.pushState(null, null, '?step_seven')
        }
    });

    $('#step-seven').click(function() {
            $('.profile-step-seven').hide();
            $('#step-seven').hide();
            $('.profile-step-eight').show();
            $('.submit-create').show();
            Cookies.set('experience_sport', $('#AthleteExperience-0').val(), { expires: 1});
            Cookies.set('experience_position', $('#experience-0').val(), { expires: 1});
            Cookies.set('experience_level', $('#athlete_profile_athlete_experiences_attributes_0_level').val(), { expires: 1});
            Cookies.set('experience_team', $('#athlete_profile_athlete_experiences_attributes_0_team_name').val(), { expires: 1});
            Cookies.set('experience_city', $('#athlete_profile_athlete_experiences_attributes_0_city').val(), { expires: 1});
            Cookies.set('experience_state', $('#athlete_profile_athlete_experiences_attributes_0_state').val(), { expires: 1});
            Cookies.set('experience_description', $('#athlete_profile_athlete_experiences_attributes_0_description').val(), { expires: 1});
        window.history.pushState(null, null, '?step_eight');
    });
    
    $('#start-over').click(function() {
        location.reload();
    });

    if (window.location.href.indexOf("gmail_contacts") > -1) {
        alert("Great!  We've invited your contacts that aren't already on Backyard Lion!");

        if (Cookies.get('gender') == "male") {
            $('input:radio[name="athlete_profile[gender]"]').filter('[value="male"]').attr('checked', true);
        } else {
            $('input:radio[name="athlete_profile[gender]"]').filter('[value="female"]').attr('checked', true);
        }

        $('#athlete_profile_city').val(Cookies.get('city'));
        $('#athlete_profile_state').val(Cookies.get('state'));
        $('#athlete_profile_zipcode').val(Cookies.get('zipcode'));
        $('#athlete_profile_country').val(Cookies.get('country'));

        $('#athlete_profile_height_feet').val(Cookies.get('height_feet'));
        $('#athlete_profile_height_inches').val(Cookies.get('height_inches'));
        $('#athlete_profile_height_weight').val(Cookies.get('weight'));

        $('#athlete_profile_birthday_1i').val(Cookies.get('birth_yr'));
        $('#athlete_profile_birthday_2i').val(Cookies.get('birth_month'));
        $('#athlete_profile_birthday_3i').val(Cookies.get('birth_day'));

        $('#athlete_profile_school_name').val(Cookies.get('school_name'));
        $('#athlete_profile_graduation_year').val(Cookies.get('grad_yr'));
        $('#athlete_profile_primary_phone').val(Cookies.get('phone'));
        $('#athlete_profile_primary_phone_type').val(Cookies.get('phone_type'));

        $('#AthleteExperience-0').val(Cookies.get('experience_sport'));
        $('#experience-0').val(Cookies.get('experience_position'));
        $('#athlete_profile_athlete_experiences_attributes_0_level').val(Cookies.get('experience_level'));
        $('#athlete_profile_athlete_experiences_attributes_0_team_name').val(Cookies.get('experience_team'));
        $('#athlete_profile_athlete_experiences_attributes_0_city').val(Cookies.get('experience_city'));
        $('#athlete_profile_athlete_experiences_attributes_0_state').val(Cookies.get('experience_state'));
        $('#athlete_profile_athlete_experiences_attributes_0_description').val(Cookies.get('experience_description'));

        $('.profile-step-seven').hide();
        $('#step-seven').hide();
        $('.profile-step-one').hide();
        $('#step-one').hide();
        $('.profile-step-eight').show();
        $('.submit-create').show();
        window.history.pushState(null, null, '?step_eight');
    }
}

function register_athlete_prof_button_clicks() {

    var buttons = ["#athlete-basic-info-btn", "#athlete-academic-info-btn", "#athlete-contact-info-btn",
                    "#athlete-guardian-info-btn", "#athlete-preferences-btn", "#experiences-btn", "#coaches-btn", "#skills-btn", "#awards-btn"];

    var info_divs = ["#athlete-prof-basic-info", "#athlete-prof-academic-info", "#athlete-prof-contact-info", "#athlete-prof-guardian-info", "#preferences",
                    "#experiences-div", "#coaches-div", "#skills-div", "#awards-div"];


    var location_url = location.search.split('button=')[1]

    if (location_url == "experience") {
        $('#experiences-btn').addClass("active");
        $('#experiences-div').show();
        turn_off_basic_buttons();
    } else if (location_url == "education") {
        $('#athlete-academic-info-btn').addClass("active");
        $('#athlete-prof-academic-info').show();
        turn_off_basic_buttons();
    } else if (location_url == "awards") {
        $('#awards-btn').addClass("active");
        $('#awards-div').show();
        turn_off_basic_buttons();
    } else if (location_url == "contact") {
        $('#athlete-contact-info-btn').addClass("active");
        $('#athlete-prof-contact-info').show();
        turn_off_basic_buttons();
    } else if (location_url == "preference-edit") {
        $('#athlete-preferences-btn').addClass("active");
        $('#preferences').show();
        turn_off_basic_buttons();
    } else if (location_url == "skills-edit") {
        $('#skills-btn').addClass("active");
        $('#skills-div').show();
        $('#athlete-basic-info-btn').removeClass("active");
        $('#athlete-prof-basic-info').hide();
    }

    $('#athlete-preferences-btn').click(function () {
        if ($('#athlete-preferences-btn').hasClass("active")) {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
        } else {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
            $('#athlete-preferences-btn').addClass("active");
            $('#preferences').show();

        }
    });

    $('#experiences-btn').click(function () {
        if ($('#experiences-btn').hasClass("active")) {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
        } else {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
            $('#experiences-btn').addClass("active");
            $('#experiences-div').show();

        }
    });

    $('#coaches-btn').click(function () {
        if ($('#coaches-btn').hasClass("active")) {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
        } else {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
            $('#coaches-btn').addClass("active");
            $('#coaches-div').show();

        }
    });

    $('#skills-btn').click(function () {
        if ($('#skills-btn').hasClass("active")) {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
        } else {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
            $('#skills-btn').addClass("active");
            $('#skills-div').show();

        }
    });

    $('#awards-btn').click(function () {
        if ($('#awards-btn').hasClass("active")) {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
        } else {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
            $('#awards-btn').addClass("active");
            $('#awards-div').show();

        }
    });


    $('#athlete-basic-info-btn').click(function () {
        if ($('#athlete-basic-info-btn').hasClass("active")) {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
        } else {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
            $('#athlete-basic-info-btn').addClass("active");
            $('#athlete-prof-basic-info').show();

        }
    });

    $('#athlete-academic-info-btn').click(function () {
        if ($('#athlete-academic-info-btn').hasClass("active")) {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
        } else {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
            $('#athlete-prof-academic-info').show();
            $('#athlete-academic-info-btn').addClass("active");
        }
    });

    $('#athlete-contact-info-btn').click(function () {
        if ($('#athlete-contact-info-btn').hasClass("active")) {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
        } else {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
            $('#athlete-prof-contact-info').show();
            $('#athlete-contact-info-btn').addClass("active");
        }
    });

    $('#athlete-guardian-info-btn').click(function () {
        if ($('#athlete-guardian-info-btn').hasClass("active")) {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
        } else {
            jQuery.each(info_divs, function(i, val) {
                $(val).hide();
            });

            jQuery.each(buttons, function(i, val) {
                $(val).removeClass("active");
            });
            $('#athlete-prof-guardian-info').show();
            $('#athlete-guardian-info-btn').addClass("active");
        }
    });

    $('#endorsements-dropdown').click(function() {
        if ($('#endorsements-dropdown').attr('aria-expanded') === "true") {
            $('#endorsements-list').hide();
            $('#endorsements-dropdown').attr('aria-expanded', "false");
        } else {
            $('#endorsements-list').show();
            $('#endorsements-dropdown').attr('aria-expanded', "true");
        }
    });
};