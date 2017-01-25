/**
 * Created by juliekent on 9/12/16.
 */

var DivisionIConferences = { "0": "American East Conference", "1": "American Athletic Conference", "2": "Atlantic 10 Conference", "3": "Atlantic Coast Conference", "4": "Atlantic Sun Conference",
                             "5": "Big 12 Conference", "6": "Big East Conference", "7":"Big Sky Conference", "8":"Big South Conference", "9":"Big Ten Conference", "10":"Big West Conference", "11":"Colonial Athletic Association",
                             "12":"Conference USA", "13":"FBS Independents", "14":"FCS Independents", "15":"Horizon League", "16":"Independents", "17":"Ivy League", "18":"Metro Atlantic Athletic Conference", "19":"Mid-American Conference",
                             "20":"Mid-Eastern Athletic Conference", "21":"Missouri Valley Conference","22":"Mountain Pacific Sports Federation", "23":"Mountain West Conference", "24":"Northeast Conference", "25":"Ohio Valley Conference",
                             "26":"Pac-12 Conference", "27":"Patriot League", "28":"Southeastern Conference", "29":"Southern Conference", "30":"Southland Conference", "31":"Southwestern Athletic Conference", "32":"Sun Belt Conference",
                             "33":"The Summit League", "34":"West Coast Conference", "35":"Western Athletic Conference", "36":"Atlantic Hockey", "37":"College Hockey America", "38":"ECAC Hockey", "39":"Hockey East", "40":"National Collegiate Hockey Conference",
                             "41":"Western Collegiate Hockey Association"};

var DivisionIIConferences = { "0":"California Collegiate Athletic Association", "1":"Central Atlantic Collegiate Conference", "2":"Central Intercollegiate Athletic Association", "3":"Conference Carolinas", "4":"East Coast Conference",
                              "5":"Great American Conference", "6":"Great Lakes Intercollegiate Athletic Conference", "7":"Great Lakes Valley Conference", "8":"Great Midwest Athletic Conference", "9":"Great Northwest Athletic Conference",
                               "10":"Gulf South Conference", "11":"Heartland Conference", "12":"Independents", "13":"Lone Star Conference","14":"Mid-America Intercollegiate Athletics Association", "15":"Mountain East Conference", "16":"Northeast Ten Conference",
                               "17":"Northern Sun Intercollegiate Conference", "18":"Pacific West Conference", "19":"Peach Belt Conference", "20":"Pennsylvania State Athletic Conference", "21":"Rocky Mountain Athletic Conference", "22":"South Atlantic Conference", "23":"Southern Intercollegiate Athletic Conference", "24":"Sunshine State Conference"};

var DivisionIIIConferences = { "0":"Allegheny Mountain Collegiate Conference", "1":"American Southwest Conference", "2":"Capital Athletic Conference", "3":"Centennial Conference", "4":"City University of New York Athletic Conference", "5":"College Conference of Illinois and Wisconsin",
                                "6":"Colonial States Athletic Conference", "7":"Commonwealth Coast Conference", "8":"Empire 8", "9":"Great Northeast Athletic Conference", "10":"Great South Athletic Conference", "11":"Heartland Collegiate Athletic Conference",
                                "12":"Independents", "13":"Iowa Intercollegiate Athletic Conference", "14":"Landmark Confernece", "15":"Liberty League", "16":"Little East Conference", "17":"Massachusetts State Collegiate Athletic Conference", "18":"Michigan Intercollegiate Athletic Association",
                                "19":"Middle Atlantic Conference", "20":"Midwest Conference", "21":"Minnesota Intercollegiate Athletic Conference", "22":"New England Collegiate Conference", "23":"New England Small College Athletic Conference", "24":"New England Women's and Men's Athletic Conference",
                                "25":"New Jersey Athletic Conference", "26":"North Atlantic Conference", "27":"North Coast Athletic Conference", "28":"North Eastern Athletic Conference", "29":"Northern Athletics Collegiate Conference", "30":"Northwest Conference",
                                "31":"Ohio Athletic Conference", "32":"Old Dominion Athletic Conference", "33":"Presidents' Athletic Conference", "34":"St. Louis Intercollegiate Athletic Conference", "35":"Skyline Conference",
                                "36":"Southern Athletic Association", "37":"Southern California Intercollegiate Athletic Conference", "38":"State University of New York Athletic Conference", "39":"University Athletic Association", "40":"Upper Midwest Athletic Conference",
                                 "41":"USA South Athletic Conference", "42":"Wisconsin Intercollegiate Athletic Conference"};

var DivisionNAIAConferences = { "0": "Centeral States Football League", "1": "Frontier Conference", "2": "Great Plains Athletic Conference", "3": "Heart of America Athletic Conference", "4": "NAIA Independents", "5": "Kansas Collegiate Athletic Conference", "6": "Mid-South Conference", "7": "Mid-States Football Association", "8": "North Star Athletic Association", "9": "The Sun Conference",
                                "10": "American Midwest Conference", "11": "Appalachian Athletic Conference", "12": "California Pacific Conference", "13": "Cascade Collegiate Conference", "14": "Chicagoland Collegiate Athletic Conference", "15": "Crossroads League", "16": "Golden State Athletic Conference", "17": "Gulf Coast Athletic Conference", "18": "NAIA Independents", "19": "Red River Athletic Conference",
                                "20": "River States Conference", "21": "Sooner Athletic Conference", "22": "Southern States Athletic Conference", "23": "Wolverine-Hoosier Athletic Conference"};

var DivisionNJCAAConferences = { "0": "Alabama Community College Conference", "1": "Arizona Community College Athletic Conference", "2": "Arrowhead Conference", "3": "Bi-State Conference","4": "Carolinas Junior College Conference","5": "Georgia Collegiate Athletic Association","6": "Great Rivers Athletic Conference","7": "Illinois N4C Conference","8": "Illinois Skyway Conference",
                                 "9": "Iowa Community College Athletic Conference","10": "Kansas Jayhawk Community College Conference","11": "Maryland Junior College Athletic Conference","12": "Massachusetts Community College Athletic Association","13": "Metro Athletic Conference",
                                "14": "Mid Hudson Conference","15": "Mid-Florida Conference","16": "Mid-State Athletic Conference","17": "Mid-West Athletic Conference","18": "Midwest Community College Athletic Conference","19": "Midwest Football Conference (NJCAA)",
                                "20": "Minnesota College Athletic Conference","21": "MISS-LOU Junior College Conference","22": "Mississippi Association of Community & Junior Colleges","23": "Mon-Dak Conference","24": "NJCAA Region 8",
                                "25": "North Texas Junior College Athletic Conference","26": "Northeast JC Football Conference","27": "Ohio Community College Athletic Conference","28": "Panhandle Conference","29": "Pennsylvania Collegiate Athletic Association","30": "Southern Conference (NJCAA)",
                                "31": "Southwest Junior College Conference","32": "Southwest Junior College Football Conference","33": "Suncoast Conference","34": "Tennessee Junior and Community College Athletic Association","35": "Western Junior College Athletic Conference", "36": "Western States Football League"};

function register_sport_division_changes() {
    $('#team_sport_division').change(function() {
        $('#team_sport_conference').empty();
        var selected = $('#team_sport_division').val();

        if (selected == "Division I") {
            $.each(DivisionIConferences, function(key, value) {
                $('#team_sport_conference').append($("<option/>", {
                    value: value,
                    text: value
                }));
            });
        } else if (selected == "Division II") {
            $.each(DivisionIIConferences, function(key, value) {
                $('#team_sport_conference').append($("<option/>", {
                    value: value,
                    text: value
                }));
            });
        } else if (selected == "Division III") {
            $.each(DivisionIIIConferences, function(key, value) {
                $('#team_sport_conference').append($("<option/>", {
                    value: value,
                    text: value
                }));
            });
        } else if (selected == "NAIA") {
            $.each(DivisionNAIAConferences, function(key, value) {
                $('#team_sport_conference').append($("<option/>", {
                    value: value,
                    text: value
                }));
            });
        } else if (selected == "NJCAA") {
            $.each(DivisionNJCAAConferences, function(key, value) {
                $('#team_sport_conference').append($("<option/>", {
                    value: value,
                    text: value
                }));
            });
        }
    });
}
