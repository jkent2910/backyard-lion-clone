class NotificationMailer < ActionMailer::Base
  default from: 'devan.moylan@backyardlion.com'

  def profile_view_notification(athlete_profile_id, viewer_user_id)
    athlete = AthleteProfile.find(athlete_profile_id)
    @user_full_name = User.find(athlete.user_id).full_name
    @email = User.find(athlete.user_id).email

    to_emails = @email

    mail(:to => to_emails,
         :subject => "Someone has been looking at your profile!")
  end

  def video_feedback(athlete_profile)
    @email = athlete_profile.user.email
    @user_full_name = athlete_profile.user.first_name

    mail(:to => @email,
         :subject => "Someone left you feedback!")
  end

  def athlete_feedback_request(athlete_requesting_id, athlete_requesting_from_id)
    @athlete_requesting_feedback_from_email = User.find(athlete_requesting_from_id.user_id).email
    @athlete_requesting_feedback_from_name = User.find(athlete_requesting_from_id.user_id).full_name

    @athlete_requesting_feedback_name = User.find(athlete_requesting_id.user_id).full_name
    @athlete_profile = AthleteProfile.find(athlete_requesting_id).id

    mail(:to => @athlete_requesting_feedback_from_email,
         :subject => "Someone is requesting feedback from you!")
  end

  def challenge_sent(athlete_profile_id)
    athlete = AthleteProfile.find(athlete_profile_id)
    @user_full_name = User.find(athlete.user_id).full_name
    email = User.find(athlete.user_id).email

    to_emails = email

    mail(:to => to_emails,
         :subject => "We've promoted you on social media!")
  end

  def promotion_notification(athlete_profile_id)
    athlete = AthleteProfile.find(athlete_profile_id)
    user_full_name = User.find(athlete.user_id).full_name
    email = User.find(athlete.user_id).email

    @user_full_name = user_full_name
    @email = email
    to_emails = @email

    mail(:to => to_emails,
         :subject => "Your Request For Promotion Has Been Approved")
  end

  def information_request_notification(athlete_profile_id, athlete_request_id)
    request = AthleteRequest.find(athlete_request_id)
    athlete = AthleteProfile.find(athlete_profile_id)
    user_full_name = User.find(athlete.user_id).full_name
    requested_info = request.athlete_profile_field.to_a.join(",")
    @user_full_name = user_full_name
    @requested_info = requested_info

    @email = User.find(athlete.user_id).email
    to_emails = @email

    unless request.team_id.blank?
      @sport = Team.find(request.team_id).sport_name
      @division = Team.find(request.team_id).sport_division
    end

    mail(:to => to_emails,
         :subject => "A coach requests additional information")

  end

  def information_request_notification_test(athlete_profile_id, athlete_request_id)
    request = AthleteRequest.find(athlete_request_id)
    athlete = AthleteProfile.find(athlete_profile_id)
    user_full_name = User.find(athlete.user_id).full_name
    requested_info = request.athlete_profile_field.to_a.join(",")
    @user_full_name = user_full_name
    @requested_info = requested_info

    unless request.team_id.blank?
      @sport = Team.find(request.team_id).sport_name
      @division = Team.find(request.team_id).sport_division
    end

    @email = User.find(athlete.user_id).email
    to_emails = @email

    mail(:to => to_emails,
         :subject => "A coach requests additional information")

  end

  def recommendation_notification(athlete_profile_id)
    athlete = AthleteProfile.find(athlete_profile_id)
    @user_full_name = User.find(athlete.user_id).full_name
    @email = User.find(athlete.user_id).email

    to_emails = @email

    mail(:to => to_emails,
         :subject => "Someone has recommended you!")
  end

  def skill_notification(athlete_profile_id)
    athlete = AthleteProfile.find(athlete_profile_id)
    @user_full_name = User.find(athlete.user_id).full_name
    @email = User.find(athlete.user_id).email

    to_emails = @email

    mail(:to => to_emails,
         :subject => "Someone has endorsed you!")
  end

  def rating_notification(athlete_profile_id)
    athlete = AthleteProfile.find(athlete_profile_id)
    @user_full_name = User.find(athlete.user_id).full_name
    @email = User.find(athlete.user_id).email

    to_emails = @email

    mail(:to => to_emails,
         :subject => "Someone has rated you!")
  end

  def challenge_time_clock_mailer(athlete_profile)
    athlete = AthleteProfile.find(athlete_profile.id)
    user_full_name = User.find(athlete.user_id).full_name
    email = User.find(athlete.user_id).email

    @user_full_name = user_full_name
    @email = email
    to_emails = @email

    mail(:to => to_emails,
         :subject => "It's time to continue the challenge!")
  end

  def same_high_school(high_school_name, new_user)

    profiles = AthleteProfile.where(school_name: high_school_name)
    unless profiles.empty?
      profiles.each do |profile|
        unless profile.id == new_user
          athlete = AthleteProfile.find(profile.id)
          unless User.find(athlete.user_id).nil?
            user_full_name = User.find(athlete.user_id).full_name
            email = User.find(athlete.user_id).email

            AthleteNotification.create(athlete_profile_id: athlete.id, notification_type: "same_high_school", notification_id: new_user )

            @user_full_name = user_full_name
            @email = email
            to_emails = @email
            mail(:to => to_emails,
                 :subject => "Someone from your high school has joined!")
          end
        end
      end
    end
  end

  def team_view(email, team_id, first_name)
    @team = Team.find(team_id)
    @college = College.find(@team.college_id).name
    @sport_name = Team.find(team_id).sport_name
    @email = email
    @first_name = first_name

    mail(:to => @email,
         :subject => "Hi, #{@first_name} - Someone has viewed your profile!")
  end

  def express_interest_team(email, team_id, first_name)
    @team = Team.find(team_id)
    @college = College.find(@team.college_id).name
    @sport_name = Team.find(team_id).sport_name
    @email = email
    @first_name = first_name

    mail(:to => @email,
         :subject => "Someone has expressed interest in #{@sport_name} at #{@college}!")
  end

  def community_promotion(user_requesting, athlete_to_send, bitly)
    @user_to_send = User.find(athlete_to_send.user_id)
    @user_to_email = @user_to_send.email
    @user_to_full_name = @user_to_send.full_name
    @bitly = bitly
    @user_requesting_promotion = user_requesting.full_name

    @user_requesting_twitter = AthleteProfile.find(user_requesting.athlete_profile).twitter_url rescue nil

    mail(:to => @user_to_email,
         :subject => "#{@user_requesting_promotion} requests your advice on Backyard Lion!",
         :from => "devan@backyardlion.com")
  end

  def complete_your_profile(user)
    @user_email = user.email
    @user_first_name = user.first_name

    mail(:to => @user_email,
         :subject => "Hi, #{@user_first_name} - Your Athletic Scholarship Awaits >>",
         :from => "devan@backyardlion.com")
  end

end