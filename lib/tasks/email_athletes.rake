desc "Send athletes email"
task send_athletes_email: :environment do
  User.where(user_type: 1).each do |u|
    AdminMailer.send_athlete_email(u.full_name, u.email).deliver_later
  end
end