class AdminMailer < ActionMailer::Base

  default from: 'devan.moylan@backyardlion.com'

  def new_coach_no_team(user, sport)
    @full_name = user.full_name
    @email = user.email
    @sport = sport

    to_emails = 'devan.moylan@backyardlion.com, julie.kent@backyardlion.com'

    mail(:to => to_emails,
         :subject => "A New Coach Has Signed Up But May Need a Team Built")
  end

  def new_coach(user)
    @full_name = user.full_name
    @email = user.email
    @team = Team.find(user.team_id)
    @team_sport = @team.sport_name
    @college_name = College.find(@team.college_id).name

    to_emails = 'devan.moylan@backyardlion.com, julie.kent@backyardlion.com'

    mail(:to => to_emails,
         :subject => "A New Coach Has Been Verified")
  end

   def new_coach_no_college(user, email)
     @full_name = user.full_name
     @email = email

     to_emails = 'devan.moylan@backyardlion.com, julie.kent@backyardlion.com'

     mail(:to => to_emails,
          :subject => "A New Coach Has Signed Up But May Need College Built")
   end

  def send_athlete_email(name, email)
    @full_name = name
    @email = email

    mail(:to => @email,
         :subject => "Closing down Backyard Lion")
  end
end