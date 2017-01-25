namespace :backyard_lion do
  desc "Find athletes that haven't created a profile"
  task no_athlete_profile: :environment do
    # Get all users who are athletes
    users = User.where(created_at: (Time.now - 24.hours)..Time.now).where(user_type: 1)
    users.each do |u|
      # Get the users athlete profile
      profile = AthleteProfile.find_by(user_id: u.id)
      if profile.nil?
        NotificationMailer.complete_your_profile(u).deliver_later
      end
    end
  end
end
