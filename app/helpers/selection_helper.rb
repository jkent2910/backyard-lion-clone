module SelectionHelper

  def valid_phone_types
    ["Home", "Work", "Cell"]
  end

  def valid_coach_positions
    ["Head Coach", "Assistant Coach", "Coordinator"]
  end

  def valid_sports
    ["Baseball", "Basketball (Female)", "Basketball (Male)", "Bowling (Female)", "Bowling (Male)",
     "Cross Country (Female)", "Cross Country (Male)", "Cheerleading", "Fencing", "Field Hockey",
     "Football (American)", "Golf (Female)", "Golf (Male)", "Rifle (Female)", "Rifle (Male)", "Gymnastics", "Ice Hockey",
     "Lacrosse", "Rowing", "Soccer (Female)", "Soccer (Male)", "Softball", "Swimming and Diving", "Tennis (Female)",
     "Tennis (Male)", "Track and Field (Female)", "Track and Field (Male)", "Volleyball (Female)",
     "Volleyball (Male)", "Wrestling"]
  end

  def valid_awards
    ["1st Team All Conference (Individual)", "2nd Team All Conference (Individual)", "3rd Team All Conference (Individual)", "Honorable Mention All Conference (Individual",
    "1st Team All County (Individual)", "2nd Team All County (Individual)", "3rd Team All County (Individual)", "Honorable Mention All County (Individual)",
    "1st Team All Region (Individual)","2nd Team All Region (Individual)", "3rd Team All Region (Individual)", "Honorable Mention All Region (Individual)",
    "1st Team All Area (Individual)","2nd Team All Area (Individual)", "3rd Team All Area (Individual)", "Honorable Mention All Area (Individual)",
    "1st Team All State (Individual)", "2nd Team All State (Individual)", "3rd Team All State (Individual)", "Honorable Mention All State (Individual)",
    "1st Place Conference (Team)","2nd Place Conference (Team)", "3rd Place Conference (Team)", "1st Place Sectionals (Team)", "2nd Place Sectionals (Team)", "3rd Place Sectionals (Team)",
    "1st Place State (Team)", "2nd Place State (Team)", "3rd Place State (Team)", "1st Place Nationals (Team)", "2nd Place Nationals (Team)", "3rd Place Nationals (Team)",
    "Other"]
  end

  def sport_positions
    ["Pitcher", "Catcher", "First Base", "Second Base", "ShortStop", "Third Base", "Left Field", "Center Field", "Right Field", "Designated Hitter", "Starting Pitcher", "Relief Pitcher", "Closer",
    "Point Guard", "Shooting Guard", "Small Forward", "Power Forward", "Center", "Bowler", "Cheerleader", "Dancer", "Wicketkeeper", "Slip", "Gully", "Point", "Cover", "Mid-off", "Mid-on", "Mid-wicket",
    "Fine leg", "Third man", "Batsman", "5k", "Wing", "Inner", "Midfielder", "Sweeper", "Fullback", "Goalie", "Quarterback", "Running back", "Wide receiver", "Tight end", "Center", "Guard", "Tackle", "Defensive end", "Linebacker",
    "Cornerback", "Safety", "Kicker", "Long snapper", "Punter", "Returner", "Pommel horse", "Rings", "Parallel bars", "Floor", "Vault", "High bar", "Goal keeper", "Wing", "Side", "Pivot", "Central", "Winger", "Center",
    "Defenseman", "Goaltender", "Attacker", "Defender", "Goalie", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "Forward", "Goal keeper", "50 yard freestyle",
    "100 yard freestyle", "200 yard freestyle", "500 yard freestyle", "1,650 yard freestyle", "100 yard backstroke", "200 yard backstroke", "100 yard breaststroke", "200 yard breaststroke", "100 yard butterfly", "200 yard butterfly",
    "One-meter dive", "Three-meter dive", "Platform dive", "60 m", "100 m", "200 m", "400 m", "800 m", "1500 m", "1600 m", "3000 m", "3200 m","5000 m", "10,000 m", "60 m hurdles", "100 m hurdles", "110 m hurdles",
    "400 m hurdles", "Long jump", "Triple jump", "High jump", "Pole vault", "Shot put", "Discus", "Hammer", "Javelin", "Pentathlon", "Heptathlon", "Decathlon", "Opposite", "Middle blocker", "Right side hitter", "Setter", "Libero", "Outside hitter",
    "Wing", "Hole set", "Flat", "Point", "103", "112", "119", "125", "130", "135", "140", "145", "152", "160", "171", "189", "215", "285"]
  end

  def valid_positions
    []
  end

  def valid_stats
    ["Recurve", "Compound", "Doubles Played", "Doubles Wins", "Doubles Losses", "Doubles Balance", "Mixed Doubles Played", "Mixed Doubles Wins", "Mixed Doubles Losses",
     "BA", "HR", "RBI", "SLG", "SB", "OPS", "CG", "ERA", "G", "GS", "IP", "K", "SHO", "SV", "W", "WHIP", "GP", "GS", "PTS", "FG%", "FT%", "3FG%", "REB", "AST", "STL",
    "BLK", "TO", "PF", "MIN", "AST/TO", "Record", "Matches", "Match Score Average", "Individual Game Average", "Baker Game Average", "Matches", "Catches", "Stumpings", "Innings",
    "Not outs", "Runs", "Highest score", "Batting average", "Centuries", "Half-centuries", "Balls faced", "Strike rate", "Run rate", "Net run rate", "Overs",
    "Balls", "Maiden overs", "Runs", "Wickets", "Bowling analysis", "No balls", "Wides", "Bowling average", "Strike rate", "Economy rate", "Best bowling", "Five wickets in an innings", "Ten wickets in a Match",
    "5K", "Goals per game", "Assists per game", "Passes Completed", "Passes Attempted", "Completion %", "Passing Yards", "Passing TD", "Passing Interceptions", "Rushing Attempts", "Rushing Yards", "Rushing Average", "Rushing TD",
    "Receptions", "Reception Yards", "Reception TD", "Total Tackles", "Sacks", "Forced Fumbles", "Fumble Recoveries", "Interceptions", "Defensive TD", "FGA", "FGM", "FG PCT", "PT PFCT", "FG Long",
    "Punts", "Punt Average", "IN20", "Punt Return Yards", "Punt Return Average", "Punt Return TD", "KO Return Yards", "KO Return Average", "KO Return TD", "Scoring Average", "Driving Distance", "Driving Accuracy Percentage", "Greens in Regulation Percentage", "SG: Tee-to-Green",
    "SG: Total", "SG: Putting", "Scrambling", "Vault", "Bars", "Beam", "Floor", "AllArr", "Appearances", "Goals", "Warnings", "2 minutes", "Disqualifications", "GP", "Goals", "Assists", "Points",
    "S", "PN", "PIM", "PPG", "PPA", "SHG", "SHA", "GWG", "GTG", "ENG", "P/M", "TOI", "ATOI", "GS", "MIN", "GA", "GAA", "W", "L", "Ties", "SOG", "SV", "SV%", "SO", "ENG",
    "GP", "G", "A", "Pts", "Sh", "Up", "Dn", "GB", "Faceoff", "Min", "GA", "GAAvg", "Save", "Pct", "W-L-T", "Goals", "Assists", "Minutes played", "Goals against average", "Shutouts", "BA", "HR", "RBI", "SLG", "SB", "OPS", "CG", "ERA", "G", "GS", "IP", "K", "SHO", "SV", "W", "WHIP",
    "50 yard freestyle", "100 yard freestyle", "200 yard freestyle", "500 yard freestyle", "1,650 yard freestyle", "100 yard backstroke", "100 yard breaststroke", "200 yard breaststroke", "100 yard butterfly", "200 yard butterfly",
    "One meter dive", "Three-meter dive", "Platform dive", "60 m", "100 m", "200 m", "400 m", "800 m", "1500 m", "1600 m", "3000 m", "3200 m", "5000 m", "10,000 m", "60 m hurdles", "100 m hurdles", "110 m hurdles", "400 m hurdles", "Long jump", "Triple jump", "High jump", "Pole vault", "Shot put",
    "Discus", "Hammer", "Javelin", "Pentathlon", "Heptathlon", "Decathlon", "Record", "Win %", "Bonus %", "Rank"]
  end

  def campus_settings
    ["Urban", "Rural"]
  end

  def school_type
    ["Public", "Private", "Two-Year"]
  end

  def communication_preferences
    ["Phone", "Email"]
  end

  def guardian_relationship
    ["Mother", "Father", "Legal Guardian", "Other"]
  end

  def level_of_play
    ["High School", "Youth", "Middle School", "Middle School (Club)", "High School (Club)", "Junior College", "College", "Semi-Pro", "Professional"]
  end

  def units
    ["Pounds", "Kilograms", "Seconds", "Minutes", "Inches", "Feet", "Yards", "Meters", "Miles", "Kilometers", "Reptitions", "Points", "MPH"]
  end

  def skills
    ["Bench Press", "Squat", "Clean", "Deadlift", "RDL", "225 reps", "Vertical Jump", "Broad Jump", "10 Yard Dash", "40 Yard Dash", "3 Cone Drill", "Shuttle Run(5-10-5)", "Pop time", "Pitching Speed", "Home to First", "60 m", "100 m", "200 m", "400 m", "800 m", "1500 m", "1600 m", "3000 m", "3200 m", "5000 m", "10,000 m", "60 m hurdles", "100 m hurdles", "110 m hurdles", "400 m hurdles", "Long jump", "Triple jump", "High jump", "Pole vault", "Shot put", "Discus", "Hammer", "Javelin", "Pentathlon",
     "Heptathlon", "Decathlon", "50 yard freestyle", "100 yard freestyle", "200 yard freestyle", "500 yard freestyle", "1,650 yard freestyle", "100 yard backstroke", "200 yard backstroke", "100 yard breaststroke", "200 yard breaststroke", "100 yard butterfly", "200 yard butterfly", "One-meter dive", "Three-meter dive", "Platform dive", "Forward Sprint (90ft)", " Backward Sprint (90ft)
      ", "Forward Agility Sprint (90ft)", "Forward Agility Sprint with Puck (90)", "Shot Speed", "Serve Speed", "Rowing 2k"]         
  end

  def divisions
    ["NCAA 1", "NCAA 2", "NCAA 3", "NAIA 1", "NAIA 2", "USCAA", "NCCAA"]
  end

  def conferences
    ["Big 10", "ACC", "Big 12", "Missouri Valley", "Pac-10", "SEC", "Big Sky"]
  end

  def valid_relationships
    ["Teammate", "Opposing Player", "Coach", "Opposing Coach", "Trainer", "Teacher", "Guidance Councelor", "Mentor", "Supporter"]
  end

end