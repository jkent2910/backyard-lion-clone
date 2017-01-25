desc "Pull coach information"
task pull_coach_info: :environment do
  User.where(user_type: 2).each do |u|
    if u.team_validated? && !u.team_id.nil?
      if u.sign_in_count >= 2
        team = Team.find(u.team_id)
        college = College.find(team.college_id).name
        puts "#{u.full_name} has signed up from #{college} for #{team.sport_name}"
      end
    end
  end
end