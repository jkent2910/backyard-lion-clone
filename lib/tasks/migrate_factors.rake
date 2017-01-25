namespace :backyard_lion do

  # This file should contain all the record creation needed to seed the database with its default values.
  # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
  #
  # Examples:
  #
  #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
  #   Mayor.create(name: 'Emanuel', city: cities.first)


  desc "Seed characteristics and migrate characteristics"
  task seed_characteristics_and_migrate_characteristics: :environment do
    characteristics = [
        {id: 1,
        new_name: "Greatest Strength"
        }
    ]

    characteristics.each do |f|
      puts "Updating #{f[:new_name]}"
      characteristic = Characteristic.find_or_create_by(id: f[:id])
      characteristic.name = f[:new_name]
      characteristic.save!
    end
  end

  desc "Seed factor choices and migrate factors"
  task seed_factor_choices_and_migrate_factors: :environment do
    # backyard-lion_development=# select * from factors;
    #  id |                                 name
    # ----+-----------------------------------------------------------------------
    #   1 | Campus Location
    #   2 | Playing Style
    #   3 | Playing Time
    #   4 | Coach Prestige
    #   5 | Conference Prestige
    #   6 | Pro Potential
    #   7 | Program Tradition
    #   8 | Television Exposure
    #   9 | Athletic Facilities
    #  10 | Championship Contender
    #  11 | Stadium Atmosphere
    #  12 | Academic Prestige
    #  13 | Campus Lifestyle
    #  14 | Coach Stability
    # (14 rows)

    factors = [
        {id: 1,
         new_name: "Campus Setting",
         choices: [
             {name: " ", value: 1},
             {name: "Low", value: 2},
             {name: "Average", value: 3},
             {name: "High", value: 4},
             {name: "Most", value: 5}
         ],
         preferences: [
             {name: " ", value: 1},
             {name: "Metropolitan", value: 2},
             {name: "Rural", value: 3},
             {name: "City", value: 4}
         ]},
        {id: 2,
         new_name: "Playing Style",
         choices: [
             {name: " ", value: 1},
             {name: "Low", value: 2},
             {name: "Average", value: 3},
             {name: "High", value: 4},
             {name: "Most", value: 5}
         ],
         preferences: [
             {name: " ", value: 1},
             {name: "≥ 0% Similarity", value: 2},
             {name: "≥ 25% Similarity", value: 3},
             {name: "≥ 50% Similarity", value: 4},
             {name: "≥ 75% Similarity", value: 5}
         ]},
        {id: 3,
         new_name: "Playing Time",
         choices: [
             {name: " ", value: 1},
             {name: "Low", value: 2},
             {name: "Average", value: 3},
             {name: "High", value: 4},
             {name: "Most", value: 5}
         ],
         preferences: [
             {name: " ", value: 1},
             {name: "Start playing in year one", value: 2},
             {name: "Start playing by year two", value: 3},
             {name: "Start playing by year three", value: 4},
             {name: "Start playing by year four", value: 5}
         ]},
        {id: 4,
         new_name: "Coach Prestige",
         choices: [
             {name: " ", value: 1},
             {name: "Low", value: 2},
             {name: "Average", value: 3},
             {name: "High", value: 4},
             {name: "Most", value: 5}
         ],
         preferences: [
             {name: " ", value: 1},
             {name: "Elite prestige", value: 2},
             {name: "≥ High prestige", value: 3},
             {name: "≥ Average prestige", value: 4},
             {name: "All levels of prestige", value: 5}

         ]},
        {id: 5,
         new_name: "Conference Prestige",
         choices: [
             {name: " ", value: 1},
             {name: "Low", value: 2},
             {name: "Average", value: 3},
             {name: "High", value: 4},
             {name: "Most", value: 5}
         ],
         preferences: [
             {name: " ", value: 1},
             {name: "Elite prestige", value: 2},
             {name: "≥ High prestige", value: 3},
             {name: "≥ Average prestige", value: 4},
             {name: "All levels of prestige", value: 5}
         ]},
        {id: 6,
         new_name: "Pro Potential",
         choices: [
             {name: " ", value: 1},
             {name: "Low", value: 2},
             {name: "Average", value: 3},
             {name: "High", value: 4},
             {name: "Most", value: 5}
         ],
        preferences: [
             {name: " ", value: 1},
             {name: "Elite placement", value: 2},
             {name: "≥ High placement", value: 3},
             {name: "≥ Average placement", value: 4},
             {name: "Any level of placement", value: 5}
        ]},
        {id: 7,
         new_name: "Program Tradition",
         choices: [
             {name: " ", value: 1},
             {name: "Low", value: 2},
             {name: "Average", value: 3},
             {name: "High", value: 4},
             {name: "Most", value: 5}
         ],
         preferences: [
             {name: " ", value: 1},
             {name: "Elite tradition", value: 2},
             {name: "≥ High tradition", value: 3},
             {name: "≥ Average tradition", value: 4},
             {name: "All levels of tradition", value: 5}
         ]},
        {id: 8,
         new_name: "Television Exposure",
         choices: [
             {name: " ", value: 1},
             {name: "Low", value: 2},
             {name: "Average", value: 3},
             {name: "High", value: 4},
             {name: "Most", value: 5}
         ],
        preferences: [
             {name: " ", value: 1},
             {name: "Elite exposure", value: 2},
             {name: "≥ High exposure", value: 3},
             {name: "≥ Average exposure", value: 4},
             {name: "All levels of exposure", value: 5}
        ]},
        {id: 9,
         new_name: "Athletic Facilities",
         choices: [
             {name: " ", value: 1},
             {name: "Low", value: 2},
             {name: "Average", value: 3},
             {name: "High", value: 4},
             {name: "Most", value: 5}
         ],
         preferences: [
             {name: " ", value: 1},
             {name: "Elite facilities", value: 2},
             {name: "≥ High-level facilities", value: 3},
             {name: "≥ Average facilities", value: 4},
             {name: "All facilitiy levels", value: 5}
         ]},
        {id: 10,
         new_name: "Championship Contender",
         choices: [
             {name: " ", value: 1},
             {name: "Low", value: 2},
             {name: "Average", value: 3},
             {name: "High", value: 4},
             {name: "Most", value: 5}
         ],
         preferences: [
             {name: " ", value: 1},
             {name: "Elite contender", value: 2},
             {name: "≥ High-level contender", value: 3},
             {name: "≥ Average contender", value: 4},
             {name: "All contender levels", value: 5}
         ]},
        {id: 11,
         new_name: "Stadium Atmosphere",
         choices: [
             {name: " ", value: 1},
             {name: "Low", value: 2},
             {name: "Average", value: 3},
             {name: "High", value: 4},
             {name: "Most", value: 5}
         ],
         preferences: [
             {name: " ", value: 1},
             {name: "Elite atmosphere", value: 2},
             {name: "≥ High-level atmosphere", value: 3},
             {name: "≥ Average atmosphere", value: 4},
             {name: "Any atmosphere level", value: 5}
         ]},
        {id: 12,
         new_name: "Academic Prestige",
         choices: [
             {name: " ", value: 1},
             {name: "Low", value: 2},
             {name: "Average", value: 3},
             {name: "High", value: 4},
             {name: "Most", value: 5}
         ],
         preferences: [
             {name: " ", value: 1},
             {name: "Elite prestige", value: 2},
             {name: "≥ High prestige", value: 3},
             {name: "≥ Average prestige", value: 4},
             {name: "All levels of prestige", value: 5}
         ]},
        {id: 13,
         new_name: "Campus Lifestyle",
         choices: [
             {name: " ", value: 1},
             {name: "Low", value: 2},
             {name: "Average", value: 3},
             {name: "High", value: 4},
             {name: "Most", value: 5}
         ],
         preferences: [
             {name: " ", value: 1},
             {name: "Party school", value: 2},
             {name: "Study school", value: 3}
         ]},
        {id: 14,
         new_name: "Coach Stability",
         choices: [
             {name: " ", value: 1},
             {name: "Low", value: 2},
             {name: "Average", value: 3},
             {name: "High", value: 4},
             {name: "Most", value: 5}
         ],
        preferences: [
             {name: " ", value: 1},
             {name: "Elite stability", value: 2},
             {name: "≥ High stability", value: 3},
             {name: "≥ Average stability", value: 4},
             {name: "All levels of stability", value: 5}
        ]}
    ]

    FactorChoice.delete_all
    ActiveRecord::Base.connection.reset_pk_sequence!('factor_choices')

    factors.each do |f|
      puts "Updating #{f[:new_name]}"
      factor = Factor.find_or_create_by(id: f[:id])
      factor.name = f[:new_name]
      factor.save!
      f[:choices].each do |c|
        factor.factor_choices.create(c)
      end

      f[:preferences].each do |p|
        factor.factor_preferences.create(p)
      end
    end
  end

  desc "Seed states and migrate states"
  task seed_states_and_migrate_states: :environment do
    regions = [
        {id: 1,
         new_name: "North East",
         region_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 2,
         new_name: "Midwest",
         region_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 3,
         new_name: "South",
         region_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 4,
         new_name: "South East",
         region_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 5,
         new_name: "West",
         region_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]}
    ]

    RegionPreference.delete_all

    ActiveRecord::Base.connection.reset_pk_sequence!('region_preferences')

    regions.each do |f|
      puts "Updating #{f[:new_name]}"
      region = Region.find_or_create_by(id: f[:id])
      region.name = f[:new_name]
      region.save!
      f[:region_preferences].each do |c|
        region.region_preferences.create(c)
      end
    end

    states = [
        {id: 1,
         new_name: "Connecticut",
         region_id: 1,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 2,
         new_name: "Delaware",
         region_id: 1,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 3,
         new_name: "Maine",
         region_id: 1,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 4,
         new_name: "Maryland",
         region_id: 1,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 5,
         new_name: "Massachusetts",
         region_id: 1,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 6,
         new_name: "New Hampshire",
         region_id: 1,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 7,
         new_name: "New Jersey",
         region_id: 1,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 8,
         new_name: "New York",
         region_id: 1,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 9,
         new_name: "Ohio",
         region_id: 1,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 10,
         new_name: "Pennsylvania",
         region_id: 1,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 11,
         new_name: "Rhode Island",
         region_id: 1,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 12,
         new_name: "Vermont",
         region_id: 1,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 13,
         new_name: "Virginia",
         region_id: 1,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 14,
         new_name: "West Virginia",
         region_id: 1,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 15,
         new_name: "District Of Columbia",
         region_id: 1,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 16,
         new_name: "Arkansas",
         region_id: 2,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 17,
         new_name: "Illinois",
         region_id: 2,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 18,
         new_name: "Indiana",
         region_id: 2,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 19,
         new_name: "Iowa",
         region_id: 2,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 20,
         new_name: "Kentucky",
         region_id: 2,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 21,
         new_name: "Michigan",
         region_id: 2,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 22,
         new_name: "Minnesota",
         region_id: 2,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 23,
         new_name: "Missouri",
         region_id: 2,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 24,
         new_name: "Tennessee",
         region_id: 2,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 25,
         new_name: "Wisconsin",
         region_id: 2,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 26,
         new_name: "Alabama",
         region_id: 3,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 27,
         new_name: "Florida",
         region_id: 3,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 28,
         new_name: "Georgia",
         region_id: 3,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 29,
         new_name: "Louisiana",
         region_id: 3,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 30,
         new_name: "Mississippi",
         region_id: 3,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 31,
         new_name: "North Carolina",
         region_id: 3,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 32,
         new_name: "South Carolina",
         region_id: 3,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 33,
         new_name: "Colorado",
         region_id: 4,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 34,
         new_name: "Kansas",
         region_id: 4,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 35,
         new_name: "Nebraska",
         region_id: 4,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 36,
         new_name: "New Mexico",
         region_id: 4,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 37,
         new_name: "North Dakota",
         region_id: 4,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 38,
         new_name: "Montana",
         region_id: 4,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 39,
         new_name: "Oklahoma",
         region_id: 4,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 40,
         new_name: "South Dakota",
         region_id: 4,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 41,
         new_name: "Texas",
         region_id: 4,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 42,
         new_name: "Wyoming",
         region_id: 4,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 43,
         new_name: "Alaska",
         region_id: 5,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 44,
         new_name: "Arizona",
         region_id: 5,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 45,
         new_name: "California",
         region_id: 5,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 46,
         new_name: "Hawaii",
         region_id: 5,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 47,
         new_name: "Idaho",
         region_id: 5,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 48,
         new_name: "Nevada",
         region_id: 5,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 49,
         new_name: "Oregon",
         region_id: 5,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 50,
         new_name: "Utah",
         region_id: 5,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
        {id: 51,
         new_name: "Washington",
         region_id: 5,
         state_preferences: [
             {name: "Yes", value: 1},
             {name: "Maybe", value: 2},
             {name: "No", value: 3}
         ]},
    ]

    StatePreference.delete_all

    ActiveRecord::Base.connection.reset_pk_sequence!('state_preferences')

    states.each do |f|
      puts "Updating #{f[:new_name]}"
      state = State.find_or_create_by(id: f[:id])
      state.name = f[:new_name]
      state.region_id = f[:region_id]
      state.save!
      f[:state_preferences].each do |c|
        state.state_preferences.create(c)
      end
    end

  end

end