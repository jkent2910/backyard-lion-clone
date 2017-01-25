# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
factors = [
    "Location",
    "Playing Style",
    "Playing Time",
    "Coach Prestige",
    "Conference Prestige",
    "Pro Potential",
    "Program Tradition",
    "Television Exposure",
    "Athletic Facilities",
    "Championship Contender",
    "Stadium Atmosphere",
    "Academic Prestige",
    "Campus Lifestyle",
    "Coach Prestige"
]

Factor.destroy_all
factors.each { |factor| Factor.create name: factor }

def create_users
  puts "Creating Backyard Lion Admin Users....."
  User.create!(email: "admin@test.com", password: "password", password_confirmation: "password", first_name: "Devan", last_name: "Moylan", user_type: 3)
  User.create!(email: "admin2@test.com", password: "password", password_confirmation: "password", first_name: "Julie", last_name: "Kent", user_type: 3)
end

def create_colleges
  puts "Creating University of Iowa....."
  iowa = College.create!(name: "University of Iowa",
                  nickname: "Hawkeyes",
                  city: "Iowa City",
                  state: "IA",
                  enrollment: "13,000",
                  campus_setting: "Suburban",
                  school_type: "Public",
                  tuition_in_state: "7,000",
                  tuition_out_of_state: "24,000",
                  email_prefix: "uiowa.edu",
                  website: "www.uiowa.edu",
                  acceptance_rate: 95,
                  sat_range: "1200-1400",
                  act_range: "23-27",
                  application_fee: "$50.00",
                  application_website: "www.commonapp.com",
                  net_price: 12000,
                  overall_grade: "A+",
                  academics_grade: "C",
                  diversity_grade: "B",
                  athletics_grade: "B",
                  professors_grade: "A",
                  dorms_grade: "A",
                  student_life_grade: "A",
                  value_grade: "A",
                  campus_grade: "B",
                  party_scene_grade: "A",
                  location_grade: "C",
                  safety_grade: "B",
                  student_faculty_ratio: "20:1",
                  financial_aid_percentage: 90,
                  avg_total_aid_awarded: 5000,
                  graduation_rate: 95,
                  num_years: 4,
                  address: "101 Kinnick Drive",
                  median_earnings: 100000)

  puts "Creating Basketball Team"
  Team.create!(sport_name: "Basketball (Male)",
               sport_division: "Division I",
               sport_conference: "Big 10",
               sport_gender: "male",
               college_id: iowa.id)

  puts "Creating Women's Basketball Team"
  Team.create!(sport_name: "Basketball (Female)",
               sport_division: "Division I",
               sport_conference: "Big 10",
               sport_gender: "female",
               college_id: iowa.id)

  puts "Creating Football Team"
  Team.create!(sport_name: "Football (American)",
               sport_division: "Division I",
               sport_conference: "Big 10",
               sport_gender: "male",
               college_id: iowa.id)

  puts "Creating Golf Team"
  Team.create!(sport_name: "Golf (Male)",
               sport_division: "Division I",
               sport_conference: "Big 10",
               sport_gender: "male",
               college_id: iowa.id)

  puts "Creating Women's Golf Team"
  Team.create!(sport_name: "Golf (Female)",
               sport_division: "Division I",
               sport_conference: "Big 10",
               sport_gender: "female",
               college_id: iowa.id)

  puts "Creating Women's Volleyball Team"
  Team.create!(sport_name: "Volleyball (Female)",
               sport_division: "Division I",
               sport_conference: "Big 10",
               sport_gender: "female",
               college_id: iowa.id)

  puts "Creating Iowa State University......"
  isu = College.create!(name: "Iowa State University",
                  nickname: "Cyclones",
                  city: "Ames",
                  state: "IA",
                  enrollment: "11,000",
                  campus_setting: "Town",
                  school_type: "Public",
                  tuition_in_state: "7,000",
                  tuition_out_of_state: "24,000",
                  email_prefix: "isu.edu",
                  website: "www.isu.edu",
                      acceptance_rate: 90,
                      sat_range: "1000-1100",
                      act_range: "20-24",
                      application_fee: "$150.00",
                      application_website: "www.commonapp.com",
                      net_price: 22000,
                      overall_grade: "F",
                      academics_grade: "F",
                      diversity_grade: "F",
                      athletics_grade: "F",
                      professors_grade: "F",
                      dorms_grade: "F",
                      student_life_grade: "F",
                      value_grade: "F",
                      campus_grade: "F",
                      party_scene_grade: "F",
                      location_grade: "F",
                      safety_grade: "F",
                      student_faculty_ratio: "25:1",
                      financial_aid_percentage: 70,
                      avg_total_aid_awarded: 15000,
                      graduation_rate: 75,
                      num_years: 4,
                      address: "101 Ames Drive",
                      median_earnings: 100)



  puts "Creating Basketball Team"
  Team.create!(sport_name: "Basketball (Male)",
               sport_division: "Division I",
               sport_conference: "Big 12",
               sport_gender: "male",
               college_id: isu.id)

  puts "Creating Women's Basketball Team"
  Team.create!(sport_name: "Basketball (Female)",
               sport_division: "Division I",
               sport_conference: "Big 12",
               sport_gender: "female",
               college_id: isu.id)

  puts "Creating Football Team"
  Team.create!(sport_name: "Football (American)",
               sport_division: "Division I",
               sport_conference: "Big 12",
               sport_gender: "male",
               college_id: isu.id)

  puts "Creating Golf Team"
  Team.create!(sport_name: "Golf (Male)",
               sport_division: "Division I",
               sport_conference: "Big 12",
               sport_gender: "male",
               college_id: isu.id)

  puts "Creating Women's Golf Team"
  Team.create!(sport_name: "Golf (Female)",
               sport_division: "Division I",
               sport_conference: "Big 12",
               sport_gender: "female",
               college_id: isu.id)

  puts "Creating Women's Volleyball Team"
  Team.create!(sport_name: "Volleyball (Female)",
               sport_division: "Division I",
               sport_conference: "Big 12",
               sport_gender: "female",
               college_id: isu.id)

  puts "Creating Georgia Institute of Technology......"
  gtech = College.create!(name: "Georgia Institute of Technology",
                  nickname: "Yellow Jackets",
                  city: "Atlanta",
                  state: "GA",
                  enrollment: "15,000",
                  campus_setting: "Metropolitan",
                  school_type: "Public",
                  tuition_in_state: "2,000",
                  tuition_out_of_state: "24,000",
                  email_prefix: "gatech.edu",
                  website: "www.gatech.edu",
                  acceptance_rate: 5,
                  sat_range: "1400-1800",
                  act_range: "30-34",
                  application_fee: "$50.00",
                  application_website: "www.commonapp.com",
                  net_price: 7000,
                  overall_grade: "A+",
                  academics_grade: "A",
                  diversity_grade: "A",
                  athletics_grade: "C",
                  professors_grade: "A",
                  dorms_grade: "A",
                  student_life_grade: "A",
                  value_grade: "A",
                  campus_grade: "A",
                  party_scene_grade: "F",
                  location_grade: "A",
                  safety_grade: "C",
                  student_faculty_ratio: "10:1",
                  financial_aid_percentage: 80,
                  avg_total_aid_awarded: 8500,
                  graduation_rate: 100,
                  num_years: 4,
                  address: "101 Buzz Drive",
                  median_earnings: 10000000)


  puts "Creating Basketball Team"
  Team.create!(sport_name: "Basketball (Male)",
               sport_division: "Division I",
               sport_conference: "ACC",
               sport_gender: "male",
               college_id: gtech.id)

  puts "Creating Women's Basketball Team"
  Team.create!(sport_name: "Basketball (Female)",
               sport_division: "Division I",
               sport_conference: "ACC",
               sport_gender: "female",
               college_id: gtech.id)

  puts "Creating Football Team"
  Team.create!(sport_name: "Football (American)",
               sport_division: "Division I",
               sport_conference: "ACC",
               sport_gender: "male",
               college_id: gtech.id)

  puts "Creating Golf Team"
  Team.create!(sport_name: "Golf (Male)",
               sport_division: "Division I",
               sport_conference: "ACC",
               sport_gender: "male",
               college_id: gtech.id)

  puts "Creating Women's Golf Team"
  Team.create!(sport_name: "Golf (Female)",
               sport_division: "Division I",
               sport_conference: "ACC",
               sport_gender: "female",
               college_id: gtech.id)

  puts "Creating Women's Volleyball Team"
  Team.create!(sport_name: "Volleyball (Female)",
               sport_division: "Division I",
               sport_conference: "ACC",
               sport_gender: "female",
               college_id: gtech.id)

  puts "Creating Drake University......"
  drake = College.create!(name: "Drake University",
                  nickname: "Bulldogs",
                  city: "Des Moines",
                  state: "IA",
                  enrollment: "9,000",
                  campus_setting: "City",
                  school_type: "Private",
                  tuition_in_state: "50,000",
                  tuition_out_of_state: "50,000",
                  email_prefix: "drake.edu",
                  website: "www.drake.edu",
                  acceptance_rate: 95,
                  sat_range: "1200-1400",
                  act_range: "23-27",
                  application_fee: "$50.00",
                  application_website: "www.commonapp.com",
                  net_price: 12000,
                  overall_grade: "A+",
                  academics_grade: "C",
                  diversity_grade: "B",
                  athletics_grade: "B",
                  professors_grade: "A",
                  dorms_grade: "A",
                  student_life_grade: "A",
                  value_grade: "A",
                  campus_grade: "B",
                  party_scene_grade: "A",
                  location_grade: "C",
                  safety_grade: "B",
                  student_faculty_ratio: "20:1",
                  financial_aid_percentage: 90,
                  avg_total_aid_awarded: 5000,
                  graduation_rate: 95,
                  num_years: 4,
                  address: "101 Drake Drive",
                  median_earnings: 100000)


  puts "Creating Basketball Team"
  Team.create!(sport_name: "Basketball (Male)",
               sport_division: "Division I",
               sport_conference: "Missouri Valley",
               sport_gender: "male",
               college_id: drake.id)

  puts "Creating Women's Basketball Team"
  Team.create!(sport_name: "Basketball (Female)",
               sport_division: "Division I",
               sport_conference: "Missouri Valley",
               sport_gender: "female",
               college_id: drake.id)

  puts "Creating Football Team"
  Team.create!(sport_name: "Football (American)",
               sport_division: "Division I",
               sport_conference: "Missouri Valley",
               sport_gender: "male",
               college_id: drake.id)

  puts "Creating Golf Team"
  Team.create!(sport_name: "Golf (Male)",
               sport_division: "Division I",
               sport_conference: "Missouri Valley",
               sport_gender: "male",
               college_id: drake.id)

  puts "Creating Women's Golf Team"
  Team.create!(sport_name: "Golf (Female)",
               sport_division: "Division I",
               sport_conference: "Missouri Valley",
               sport_gender: "female",
               college_id: drake.id)

  puts "Creating Women's Volleyball Team"
  Team.create!(sport_name: "Volleyball (Female)",
               sport_division: "Division I",
               sport_conference: "Missouri Valley",
               sport_gender: "female",
               college_id: drake.id)

  puts "Creating Coe College......"
  coe = College.create!(name: "Coe College",
                  nickname: "Eagles",
                  city: "Cedar Rapids",
                  state: "IA",
                  enrollment: "4,000",
                  campus_setting: "City",
                  school_type: "Private",
                  tuition_in_state: "45,000",
                  tuition_out_of_state: "45,000",
                  email_prefix: "coe.edu")


  puts "Creating Basketball Team"
  Team.create!(sport_name: "Basketball (Male)",
               sport_division: "Division III",
               sport_conference: "Iowa Conference",
               sport_gender: "male",
               college_id: coe.id)

  puts "Creating Women's Basketball Team"
  Team.create!(sport_name: "Basketball (Female)",
               sport_division: "Division III",
               sport_conference: "Iowa Conference",
               sport_gender: "female",
               college_id: coe.id)

  puts "Creating Football Team"
  Team.create!(sport_name: "Football (American)",
               sport_division: "Division III",
               sport_conference: "Iowa Conference",
               sport_gender: "male",
               college_id: coe.id)

  puts "Creating Golf Team"
  Team.create!(sport_name: "Golf (Male)",
               sport_division: "Division III",
               sport_conference: "Iowa Conference",
               sport_gender: "male",
               college_id: coe.id)

  puts "Creating Women's Golf Team"
  Team.create!(sport_name: "Golf (Female)",
               sport_division: "Division III",
               sport_conference: "Iowa Conference",
               sport_gender: "female",
               college_id: coe.id)

  puts "Creating Women's Volleyball Team"
  Team.create!(sport_name: "Volleyball (Female)",
               sport_division: "Division III",
               sport_conference: "Iowa Conference",
               sport_gender: "female",
               college_id: coe.id)

  puts "Creating University of Michigan......"
  michigan = College.create!(name: "University of Michigan",
                  nickname: "Wolverines",
                  city: "Ann Arbor",
                  state: "MI",
                  enrollment: "30,000",
                  campus_setting: "Town",
                  school_type: "Private",
                  tuition_in_state: "17,000",
                  tuition_out_of_state: "30,000",
                  email_prefix: "umich.edu")

  puts "Creating Basketball Team"
  Team.create!(sport_name: "Basketball (Male)",
               sport_division: "Division I",
               sport_conference: "Big 10",
               sport_gender: "male",
               college_id: michigan.id)

  puts "Creating Women's Basketball Team"
  Team.create!(sport_name: "Basketball (Female)",
               sport_division: "Division I",
               sport_conference: "Big 10",
               sport_gender: "female",
               college_id: michigan.id)

  puts "Creating Football Team"
  Team.create!(sport_name: "Football (American)",
               sport_division: "Division I",
               sport_conference: "Big 10",
               sport_gender: "male",
               college_id: michigan.id)

  puts "Creating Golf Team"
  Team.create!(sport_name: "Golf (Male)",
               sport_division: "Division I",
               sport_conference: "Big 10",
               sport_gender: "male",
               college_id: michigan.id)

  puts "Creating Women's Golf Team"
  Team.create!(sport_name: "Golf (Female)",
               sport_division: "Division I",
               sport_conference: "Big 10",
               sport_gender: "female",
               college_id: michigan.id)

  puts "Creating Women's Volleyball Team"
  Team.create!(sport_name: "Volleyball (Female)",
               sport_division: "Division I",
               sport_conference: "Big 10",
               sport_gender: "female",
               college_id: michigan.id)
end

def create_nonadmin_users
  50.times do |n|
    email = Faker::Internet.email
    password = "password"
    password_confirmation = "password"
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    user_type = 1

    user = User.create!(email: email, password: password, password_confirmation: password_confirmation, first_name: first_name, last_name: last_name, user_type: user_type)
    create_athlete_profile(user.id)
  end
end

def create_majors
  College.all.each do |c|
    CollegeMajor.create!(name: "English", college_id: c.id, most_popular: true)
    CollegeMajor.create!(name: "Psychology", college_id: c.id, most_popular: true)
    CollegeMajor.create!(name: "Math", college_id: c.id, most_popular: true)
    CollegeMajor.create!(name: "Engineering", college_id: c.id, most_popular: true)
    CollegeMajor.create!(name: "Journalism", college_id: c.id, most_popular: true)
    CollegeMajor.create!(name: "Business", college_id: c.id, most_popular: true)
    CollegeMajor.create!(name: "Accounting", college_id: c.id, most_popular: true)
    CollegeMajor.create!(name: "Computer Science", college_id: c.id, most_popular: true)
    CollegeMajor.create!(name: "Underwater Basketweaving", college_id: c.id, most_popular: true)
    CollegeMajor.create!(name: "Physics", college_id: c.id, most_popular: false)
    CollegeMajor.create!(name: "Architecture", college_id: c.id, most_popular: false)
    CollegeMajor.create!(name: "Sports Studies", college_id: c.id, most_popular: false)
    CollegeMajor.create!(name: "Philosophy", college_id: c.id, most_popular: false)
    CollegeMajor.create!(name: "Sociology", college_id: c.id, most_popular: false)
  end
end

def create_athlete_profile(user_id)
  athlete_profile = AthleteProfile.create!(user_id: user_id, gender: "male", country: "United States", city: Faker::Address.city, state: Faker::Address.state,
                         zipcode: Faker::Address.zip_code, height_feet: Faker::Number.between(5,7), height_inches: Faker::Number.between(0,11),
                         weight: Faker::Number.between(140,370), birthday: Faker::Date.between(17.years.ago, 13.years.ago),
                         school_name: Faker::Company.name, graduation_year: Faker::Number.between(2017, 2021), primary_phone: Faker::PhoneNumber.cell_phone,
                         primary_phone_type: "Cell", athlete_experiences_attributes: [position: "Quarterback", team_name: Faker::Team.creature, sport: "Football (American)", city: Faker::Address.city,
                                                                                     state: Faker::Address.state, description: Faker::Lorem.paragraphs(1), level: "High School"])

  experience = AthleteExperience.where(athlete_profile_id: athlete_profile.id).last

  AthleteAward.create!(name: "Other", issuer: Faker::Company.name, year: Faker::Number.between(2015,2017), description: Faker::Lorem.paragraphs(1), athlete_profile_id: athlete_profile.id)

  AthleteRecommendation.create!(athlete_profile_id: athlete_profile.id, giver_first_name: Faker::Name.first_name, giver_last_name: Faker::Name.last_name,
                                giver_relationship: "Friend", giver_position: "Football Coach", recommendation_text: Faker::Lorem.paragraphs(1),
                                athlete_experience_id: experience.id, giver_contact_info: "contact@email.com")

  Skill.create!(name: "Bench Press", units: "lbs", athlete_profile_id: athlete_profile.id, skill_result: "500", skill_result_year: 2015)
  Skill.create!(name: "Bicep Curl", units: "lbs", athlete_profile_id: athlete_profile.id, skill_result: "100", skill_result_year: 2015)
end

create_colleges
create_users
create_nonadmin_users
create_majors


