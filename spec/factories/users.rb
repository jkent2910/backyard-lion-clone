FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@gmail.com"
  end

  factory :user do |u|
    u.email
    u.password 'password'
    u.password_confirmation 'password'
    u.first_name 'test'
    u.last_name 'user'
    u.user_type 1
  end

  factory :devan, :parent => :user do |s|
    s.email 'devan@gmail.com'
    s.first_name 'Devan'
    s.last_name 'Moylan'
    s.user_type 1
  end

  factory :julie, :parent => :user do |s|
    s.email "julie@gmail.com"
    s.first_name 'Julie'
    s.last_name ' Kent'
    s.user_type 1
  end

  factory :byl_admin, :parent => :user do |s|
    s.email "byladmin@gmail.com"
    s.first_name 'Julie'
    s.last_name ' Admin'
    s.user_type 3
  end

  factory :coach_kirk, :parent => :user do |s|
    s.email "coach@uiowa.edu"
    s.first_name "Kirk"
    s.last_name "Ferentz"
    s.user_type 2
    s.college_id {FactoryGirl.create(:university_of_iowa)}
  end

  factory :gary_barta, :parent => :user do |s|
    s.email "garybarta@uiowa.edu"
    s.first_name "Gary"
    s.last_name "Barta"
    s.user_type 4
    s.college_id {FactoryGirl.create(:university_of_iowa)}
    s.college_admin_flag true
  end
end