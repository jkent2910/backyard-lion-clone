FactoryGirl.define do
  factory :college do
    name "MyString"
    nickname "MyString"
    state "MyString"
    city "MyString"
    enrollment 1
    campus_setting "MyString"
    school_type "MyString"
    tuition_in_state "MyString"
    tuition_out_of_state "MyString"
  end

  factory :university_of_iowa, :parent => :college do |c|
    c.name "University of Iowa"
    c.email_prefix "uiowa.edu"
    c.state "Iowa"
    c.city "Iowa City"
  end

  factory :iowa_state_university, :parent => :college do |c|
    c.name "Iowa State University"
    c.email_prefix "isu.edu"
    c.state "Iowa"
    c.city "Ames"
  end
end