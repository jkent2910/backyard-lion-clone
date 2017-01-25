/**
 * Created by juliekent on 12/4/16.
 */

$(document).ready(function() {
/*    rate_athletes();*/
});

/*
function rate_athletes() {

    // If you're on the rate_athletes page
    if (window.location.href.indexOf("rate_athletes") > -1) {

        // Make sure you're on the index page
        if (window.location.href.indexOf("page") == -1) {
            // Get the cookie
            var page_param = Cookies.get('rate_athletes_page');

            // Get the basic URL w/ athlete_profile_id
            var the_url = window.location.href;
            // Navigate to the last cookie page

            if (page_param != undefined) {
                window.location.href = the_url + "?&" + page_param;
            }
        }
    }

    $('.next_page').click(function() {
        if (window.location.href.indexOf("page") > -1) {
            var page_num = window.location.href.split("&").pop();
            if (page_num.length > 5) {
                var split_by_question_mark = window.location.href.split("?").pop();
                Cookies.set('rate_athletes_page', split_by_question_mark);
            } else {
                Cookies.set('rate_athletes_page', page_num );
            }
        }
    });
}
*/

