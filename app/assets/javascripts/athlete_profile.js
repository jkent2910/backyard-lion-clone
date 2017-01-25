/* Stats */

var archeryStats = { "0": "Recurve", "1": "Compound"};

var badmintonStats = { "0": "Doubles Played", "1": "Doubles Wins", "2": "Doubles Losses", "3": "Doubles Balance", "4": "Mixed Doubles Played", "5": "Mixed Doubles Wins", "6": "Mixed Doubles Losses", "7": "Mixed Balance"};

var baseballStats = { "0": "BA", "1": "HR", "2": "RBI", "3": "SLG", "4": "SB", "5": "OPS", "6": "CG", "7": "ERA", "8": "G", "9": "GS", "10": "IP", "11": "K", "12": "SHO", "13": "SV", "14": "W", "15": "WHIP"};

var basketballStats = { "0": "", "1": "GP", "2": "GS", "3": "PTS", "4": "FG%", "5": "FT%", "6": "3FG%", "7": "REB", "8": "AST", "9": "STL", "10": "BLK", "11": "TO", "12": "PF", "13": "MIN", "14": "AST/TO"};

var bowlingStats = { "0": "", "1": "Record", "2": "Matches", "3": "Match Score Average", "4": "Individual Game Average", "5": "Baker Game Average"};

var cricketStats = {"0": "", "1": "Matches", "2": "Catches", "3": "Stumpings", "4": "Innings", "5": "Not outs", "6": "Runs", "7": "Highest score", "8": "Batting average", "9": "Centuries", "10": "Half-centuries", "11": "Balls faced", "12": "Strike rate", "13": "Run rate", "14": "Net run rate", "15": "Overs", "16": "Balls", "17": "Maiden overs", "18": "Runs", "19": "Wickets", "20": "Bowling analysis", "21": "No balls", "22": "Wides", "23": "Bowling average", "24": "Strike rate", "25": "Economy rate", "26": "Best bowling", "27": "Five wickets in an innings", "28": "Ten wickets in a Match"};

var crosscountryStats = { "0": "", "1": "5k"};

var fieldhockeyStats = { "0": "", "1": "Goals per game", "2": "Assists per game"};

var footballStats = { "0": "", "1": "Passes Completed", "2": "Passes Attempted", "3": "Completion %", "4": "Passing Yards", "5": "Passing TD", "6": "Passing Interceptions", "7": "Rushing Attempts", "8": "Rushing Yards", "9": "Rushing Average", "10": "Rushing TD", "11": "Receptions", "12": "Reception Yards", "13": "Reception TD", "14": "Total Tackles", "15": "Sacks", "16": "Forced Fumbles", "17": "Fumble Recoveries", "18": "Interceptions", "19": "Defensive TD", "20": "FGA", "21": "FGM", "22": "FG PCT", "23": "PT PCT", "24": "FG Long", "25": "Punts", "26": "Punt Average", "27": "IN20", "28": "Punt Return Yards", "29": "Punt Return Average", "30": "Punt Return TD", "31": "KO Return Yards", "32": "KO Return Average", "33": "KO Return TD"};

var golfStats = { "0": "", "1": "Scoring Average", "2": "Driving Distance", "3": "Driving Accuracy Percentage", "4": "Greens In Regulation Percentage", "5": "SG: Tee-to-Green", "6": "SG: Total", "7": "SG: Putting", "8": "Scrambling"};

var gymnasticsStats = { "0": "", "1": "Vault", "2": "Bars", "3": "Beam", "4": "Floor", "5": "AllArr"};

var handballStats = { "0": "", "1": "Appearances", "2": "Goals", "3": "Warnings", "4": "2 minutes", "5": "Disqualifications"};

var icehockeyStats = { "0": "", "1": "GP", "2": "Goals", "3": "Assists", "4": "Points", "5": "S", "6": "PN", "7": "PIM", "8": "PPG", "9": "PPA", "10": "SHG", "11": "SHA", "12": "GWG", "13": "GTG", "14": "ENG", "15": "P/M", "16": "TOI", "17": "ATOI", "18": "GS", "19": "MIN", "20": "GA", "21": "GAA", "22": "W", "23": "L", "24": "Ties", "25": "SOG", "26": "SV", "27": "SV%", "28": "SO", "29": "ENG"};

var lacrosseStats = { "0": "", "1": "GP", "2": "G", "3": "A", "4": "Pts", "5": "Sh", "6": "Up", "7": "Dn", "8": "GB", "9": "Faceoff", "10": "Min.", "11": "GA", "12": "GAAvg", "13": "Save", "14": "Pct", "15": "W-L-T"};

var soccerStats = { "0": "", "1": "Goals", "2": "Assists", "3": "Minutes played", "4": "Goals against average", "5": "Shutouts"};

var softballStats = { "0": "BA", "1": "HR", "2": "RBI", "3": "SLG", "4": "SB", "5": "OPS", "6": "CG", "7": "ERA", "8": "G", "9": "GS", "10": "IP", "11": "K", "12": "SHO", "13": "SV", "14": "W", "15": "WHIP"};

var swimmingStats = { "0": "", "1": "50 yard freestyle", "2": "100 yard freestyle", "3": "200 yard freestyle", "4": "500 yard freestyle", "5": "1,650 yard freestyle", "6": "100 yard backstroke", "7": "200 yard backstroke", "8": "100 yard breaststroke", "9": "200 yard breaststroke", "10": "100 yard butterfly", "11": "200 yard butterfly", "12": "One-meter dive", "13": "Three-meter dive", "14": "Platform dive"};

var trackandfieldStats = { "0": "", "1": "60 m", "2": "100 m", "3": "200 m", "4": "400 m", "5": "800 m", "6": "1500 m", "7": "1600 m", "8": "3000 m", "9": "3200 m", "10": "5000 m", "11": "10,000 m", "12": "60 m hurdles", "13": "100 m hurdles", "14": "110 m hurdles", "15": "400 m hurdles", "16": "Long jump", "17": "Triple jump", "18": "High jump", "19": "Pole vault", "20": "Shot put", "21": "Discus", "22": "Hammer", "23": "Javelin", "24": "Pentathlon", "25": "Heptathlon", "26": "Decathlon"};

var wrestlingStats = { "0": "", "1": "Record", "2": "Win %", "3": "Bonus %", "4": "Rank"};

/* Positions */

var archeryPositions = {"1": " "};

var badmintonPositions = {"1": " "};

var baseballPositions = { "0": "", "1": "Pitcher", "2": "Catcher", "3": "First Base", "4": "Second Base", "5": "ShortStop", "6": "Third Base", "7": "Left Field", "8": "Center Field", "9": "Right Field", "10": "Designated Hitter", "11": "Starting Pitcher", "12": "Relief Pitcher", "13": "Closer"};

var basketballPositions = { "0": "", "1": "Point Guard", "2": "Shooting Guard", "3": "Small Forward", "4": "Power Forward", "5": "Center"};

var bowlingPositions = { "0": "", "1": "Bowler" };

var cheerleadingPositions = { "0": "", "1": "Cheerleader", "2": "Dancer"};

var cricketPositions = { "0": "", "1": "Wicketkeeper", "2": "Slip", "3": "Gully", "4": "Point", "5": "Cover", "6": "Mid-off", "7": "Bowler", "8": "Mid-on", "9": "Mid-wicket", "10": "Fine leg", "11": "Third man", "12": "Batsman"};

var crosscountryPositions = { "0": "", "1": "5k"};

var equestrianridingPositions = { "1": " "};

var fencingPositions = { "1": " "};

var fishingPositions = { "1": " "};

var fieldhockeyPositions = { "0": "", "1": "Wing", "2": "Inner", "3": "Midfielder", "4": "Sweeper", "5": "Fullback", "6": "Goalie"};

var footballPositions = { "0": "", "1": "Quarterback", "2": "Running back", "3": "Wide receiver", "4": "Tight end", "5": "Center", "6": "Guard", "7": "Tackle", "8": "Defensive tackle", "9": "Defensive end", "10": "Linebacker", "11": "Cornerback", "12": "Safety", "13": "Kicker", "14": "Long snapper", "15": "Punter", "16": "Returner"};

var gymnasticsPositions = { "0": "", "1": "Pommel horse", "2": "Rings", "3": "Parallel bars", "4": "Floor", "5": "Vault", "6": "High bar"};

var golfPositions = { "1": " "};

var handballPositions = { "0": "", "1": "Goal keeper", "2": "Wing", "3": "Side", "4": "Pivot", "5": "Central"};

var icehockeyPositions = { "0": "", "1": "Winger", "2": "Center", "3": "Defenseman", "4": "Goaltender"};

var lacrossePositions = { "0": "", "1": "Attacker", "2": "Midfielder", "3": "Defender", "4": "Goalie"};

var motorsportsPositions = { "1": " "};

var riflePositions = { "1": " "};

var rodeoPositions = { "1": " "};

var rowingPositions = { "1": " "};

var rugbyPositions = { "0": "", "1": "1", "2": "2", "3": "3", "4": "4", "5": "5", "6": "6", "7": "7", "8": "8", "9": "9", "10": "10", "11": "11", "12": "12", "13": "13", "14": "14", "15": "15"};

var sailingPositions = { "1": " "};

var skiingPositions = { "1": " "};

var soccerPositions = { "0": "", "1": "Forward", "2": "Midfielder", "3": "Defender", "4": "Goal keeper"};

var squashPositions = { "1": " "};

var swimmingPositions = { "0": "", "1": "50 yard freestyle", "2": "100 yard freestyle", "3": "200 yard freestyle", "4": "500 yard freestyle", "5": "1,650 yard freestyle", "6": "100 yard backstroke", "7": "200 yard backstroke", "8": "100 yard breaststroke", "9": "200 yard breaststroke", "10": "100 yard butterfly", "11": "200 yard butterfly", "12": "One-meter dive", "13": "Three-meter dive", "14": "Platform dive"};

var tennisPositions = { "1": " "};

var trackandfieldPositions = { "0": "", "1": "Sprinter", "2": "Mid-Distance", "3": "Distance", "4": "Hurdler", "5": "Jumper", "6": "Thrower", "7": "Heptathlete", "8": "Decathlete"};

var volleyballPositions = { "0": "", "1": "Opposite", "2": "Middle blocker", "3": "Right side hitter", "4": "Setter", "5": "Libero", "6": "Outside hitter"};

var waterpoloPositions = { "0": "", "1": "Wing", "2": "Hole set", "3": "Flat", "4": "Point"};

var wrestlingPositions = { "0": "", "1": "103", "2": "112", "3": "119", "4": "125", "5": "130", "6": "135", "7": "140", "8": "145", "9": "152", "10": "160", "11": "171", "12": "189", "13": "215", "14": "285"};

function updateDropdown(element_to_update, el) {
    $(element_to_update).empty();
    if (el == "Football (American)") {
        $.each(footballPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Baseball") {
        $.each(baseballPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Archery") {
        $.each(archeryPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Badminton") {
        $.each(badmintonPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Basketball (Female)") {
        $.each(basketballPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Basketball (Male)") {
        $.each(basketballPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Bowling (Female)") {
        $.each(bowlingPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Bowling (Male)") {
        $.each(bowlingPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Cheerleading") {
        $.each(cheerleadingPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Cricket") {
        $.each(cricketPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Cross Country (Female)") {
        $.each(crosscountryPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Cross Country (Male)") {
        $.each(crosscountryPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Equestrian-Riding") {
        $.each(equestrianridingPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Fencing") {
        $.each(fencingPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Field Hockey (Female)") {
        $.each(fieldhockeyPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Field Hockey (Male)") {
        $.each(fieldhockeyPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Fishing") {
        $.each(fishingPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Golf (Female)") {
        $.each(golfPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Golf (Male)") {
        $.each(golfPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Gymnastics") {
        $.each(gymnasticsPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Handball") {
        $.each(handballPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Golf (Female)") {
        $.each(golfPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Ice Hockey (Female)") {
        $.each(icehockeyPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Ice Hockey (Male)") {
        $.each(icehockeyPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Lacrosse (Female)") {
        $.each(lacrossePositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Lacrosse (Male)") {
        $.each(lacrossePositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Motorsports") {
        $.each(motorsportsPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Rifle (Female)") {
        $.each(riflePositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Rifle (Male)") {
        $.each(riflePositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Rodeo") {
        $.each(rodeoPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Rowing - Crew") {
        $.each(rowingPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Rugby") {
        $.each(rugbyPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Sailing") {
        $.each(sailingPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Skiing") {
        $.each(skiingPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Rifle (Female)") {
        $.each(riflePositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Soccer (Female)") {
        $.each(soccerPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Soccer (Male)") {
        $.each(soccerPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Softball") {
        $.each(baseballPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Squash (Female)") {
        $.each(squashPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Squash (Male)") {
        $.each(squashPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Swimming - Diving (Female)") {
        $.each(swimmingPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Swimming - Diving (Male)") {
        $.each(swimmingPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Tennis (Female)") {
        $.each(tennisPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Tennis (Male)") {
        $.each(tennisPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Track and Field (Female)") {
        $.each(trackandfieldPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Track and Field (Male)") {
        $.each(trackandfieldPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Volleyball (Female)") {
        $.each(volleyballPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Water Polo (Male)") {
        $.each(waterpoloPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Wrestling") {
        $.each(wrestlingPositions, function(key,value) {
            $(element_to_update).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    }
}

function updatePositionsSearch(el, id) {

    $('#q_athlete_experiences_position_cont').empty();
    updateDropdown('#q_athlete_experiences_position_cont', el);
}

function updatePositions(el, id, name) {

    var experience_id = id.split("-")[1];

    var parse_name = name.split('[');
    var get_number_portion = parse_name[2].slice(0,-1);

    var position_name_element = "athlete_profile[athlete_experiences_attributes][" + get_number_portion + "]" + "[position]";
    var get_position_element = $('[name="' + position_name_element + '"]');
    updateDropdown(get_position_element, el);

    var second_position_name_element = "athlete_profile[athlete_experiences_attributes][" + get_number_portion + "]" + "[secondary_position]";
    var get_second_position_element = $('[name="' + second_position_name_element + '"]');

    updateDropdown(get_second_position_element, el);
}

function updateStatistics(val, id, name) {
    var stat_select = $('.stat-select');
    set_statistics_for_experience(val, stat_select);
}

function updateCoachPositions(el, id, name) {

    var parse_name = name.split('[');
    var get_number_portion = parse_name[2].slice(0,-1);

    var position_name_element = "athlete_profile[coaches_attributes][" + get_number_portion + "]" + "[position]";
    var get_position_element = $('[name="' + position_name_element + '"');

    updateDropdown(get_position_element, el);
}

function updateUnits(el, id, name) {

    var skill_id = id.split("-")[1];

    var parse_name = name.split('[');
    var get_number_portion = parse_name[2].slice(0,-1);

    var skill_name_element = "athlete_profile[skills_attributes][" + get_number_portion + "]" + "[units]";
    var get_skill_element = $('[name="' + skill_name_element + '"');

    $(get_skill_element).empty();

    timeUnits = { "1": "Seconds", "2": "Minutes"};
    weightUnits = { "1": "Pounds", "2": "Kilograms"};
    distanceUnits = { "1": "Inches", "2": "Feet", "3": "Yards", "4": "Meters", "5": "Miles", "6": "Kilometers"};
    Units = { "1": "Repetitions", "2": "Points"};
    velocityUnits = {"1": "MPH"}

    if (el == "Squat") {
        $.each(weightUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Bench Press") {
        $.each(weightUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Clean") {
        $.each(weightUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Deadlift") {
        $.each(weightUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "RDL") {
        $.each(weightUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Bench Press") {
        $.each(weightUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "225 reps") {
        $.each(Units, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Vertical Jump") {
        $.each(distanceUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Broad Jump") {
        $.each(distanceUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "10 Yard Dash") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "40 Yard Dash") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "3 Cone Drill") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Shuttle Run (5-10-5)") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "10 Yard Dash") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Pop time") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Pitching Speed") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Home to First") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "60 m") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "100 m") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "200 m") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "400 m") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "800 m") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "1500 m") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "1600 m") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "3000 m") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "3200 m") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    }  else if (el == "5000 m") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    }  else if (el == "10,000 m") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "60 m hurdles") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "100 m hurdles") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "110 m hurdles") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "400 m hurdles") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Long jump") {
        $.each(distanceUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Triple jump") {
        $.each(distanceUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "High jump") {
        $.each(distanceUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    }  else if (el == "Pole vault") {
        $.each(distanceUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Shot put") {
        $.each(distanceUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    }  else if (el == "Discus") {
        $.each(distanceUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Hammer") {
        $.each(distanceUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Javelin") {
        $.each(distanceUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Pentathlon") {
        $.each(Units, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Heptathlon") {
        $.each(Units, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Decathlon") {
        $.each(Units, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "50 yard freestyle") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "100 yard freestyle") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "200 yard freestyle") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    }  else if (el == "500 yard freestyle") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "1,650 yard freestyle") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "100 yard backstroke") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "200 yard backstroke") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "100 yard breaststroke") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "200 yard breaststroke") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "100 yard butterfuly") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "200 yard butterfuly") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "One-meter dive") {
        $.each(Units, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Three-meter dive") {
        $.each(Units, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Platform dive") {
        $.each(Units, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Forward Sprint (90ft)") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Backward Sprint (90ft)") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Forward Agility Sprint (90ft)") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else if (el == "Forward Agility Sprint with Puck (90ft)") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    }  else if (el == "Shot Speed") {
        $.each(velocityUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    }  else if (el == "Serve Speed") {
        $.each(velocityUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    }  else if (el == "Rowing 2k") {
        $.each(timeUnits, function(key,value) {
            $(get_skill_element).append($("<option/>", {
                value: value,
                text: value
            }));
        });
    } else {

    }
}
