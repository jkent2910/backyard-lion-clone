FactoryGirl.define do
  factory :athlete_profile do
    gender "female"
    country "United States"
    state "Iowa"
    city "Marion"
    zipcode "52302"
    height_feet "6"
    height_inches "0"
    weight "175"
    birthday Date.today
    school_name "Linn Mar High School"
    graduation_year "2018"
    primary_phone "319-521-8353"

    after(:build) do |profile|
      profile.athlete_experiences << build_list(:athlete_experience, 1)
    end
  end
end