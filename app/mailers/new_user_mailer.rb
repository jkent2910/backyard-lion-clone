class NewUserMailer < ActionMailer::Base

  include TwitterHelper
  
  default from: 'devan.moylan@backyardlion.com'

  def new_user_mailer(email, first_name, last_name, user_type, referred_flag)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @user_type = user_type
    @referred_flag = referred_flag
    to_emails = "julie.kent@backyardlion.com, devan.moylan@backyardlion.com"
    mail(:to => to_emails,
         :subject => "REFERRED: #{@referred_flag}: #{email} has joined Backyard Lion as a #{user_type}")
  end

  def new_contacts_mailer(user, contacts)
    @full_name = user
    @contacts = contacts
    to_emails = "julie.kent@backyardlion.com, devan.moylan@backyardlion.com"
    mail(:to => to_emails,
         :subject => "#{user} has invited contacts to join Backyard Lion")

  end

  def daily_profile_strength(overall_score_average, overall_score_percentage)
    @overall_score_average = overall_score_average
    @overall_score_percentage = overall_score_percentage

    to_emails = "julie.kent@backyardlion.com, devan.moylan@backyardlion.com"
    mail(:to => to_emails,
         :subject => "Daily profile strength e-mail")
  end


  def deleted_athlete(athlete_profile_id, reason)
    athlete = AthleteProfile.find(athlete_profile_id)
    @user_name = User.find(athlete.user_id).full_name
    @athlete_profile_id = athlete_profile_id
    @user_id = athlete.user_id
    @reason = reason

    @user_email = User.find(athlete.user_id).email

    to_emails = "julie.kent@backyardlion.com, devan.moylan@backyardlion.com"
    mail(:to => to_emails,
         :subject => "#{@user_name} has deleted their profile")
  end

  def achievement_requested(athlete_profile_id, achievement, platform, handle)
    athlete = AthleteProfile.find(athlete_profile_id)
    @user_full_name = User.find(athlete.user_id).full_name
    @achievement = achievement
    @platform = platform
    @handle = handle

    to_emails = "julie.kent@backyardlion.com, devan.moylan@backyardlion.com"
    mail(:to => to_emails,
         :subject => "#{@user_full_name} has requested you promote them")

  end

  def feedback_request_sent(athlete)
    @user_full_name = User.find(athlete.user_id).full_name

    to_emails = "julie.kent@backyardlion.com, devan.moylan@backyardlion.com"
    mail(:to => to_emails,
         :subject => "#{@user_full_name} has requested feedback")
  end

  def promotion_notification(athlete_profile_id, bitly, twitter, facebook, accomplishment)
    athlete = AthleteProfile.find(athlete_profile_id)
    unless athlete.guardian_twitter.blank?
      @guardian_twitter = athlete.guardian_twitter
    end

    unless athlete.second_guardian_twitter.blank?
      @guardian_two_twitter = athlete.second_guardian_twitter
    end

    @user_full_name = User.find(athlete.user_id).full_name
    @bitly = bitly
    @twitter = twitter
    @facebook = facebook
    @accomplishment = accomplishment
    @athlete_profile = athlete.id

    url = "https://www.backyardlion.com/athlete_profiles/#{athlete.id}/twitter_player_card"

    kit = IMGKit.new(url, height: 500, width: 400)
    img = kit.to_img(:png)
    file = Tempfile.new(["template_#{athlete.id}", 'png'], 'tmp', :encoding => 'ascii-8bit')
    file.write(img)
    new_file = File.new(file)

    user = athlete.user.first_name
    school = athlete.school_name
    sport = athlete.athlete_experiences.first.sport

    if athlete.twitter_url.blank?
      message = tweet_collection_no_twitter(user, school, sport, @bitly)
    else
      message = tweet_collection_has_twitter(user, school, sport, @bitly, athlete)
    end

    $client.update_with_media(message, new_file)

    to_emails = "julie.kent@backyardlion.com, devan.moylan@backyardlion.com"
    mail(:to => to_emails,
         :subject => "It's time to promote #{@user_full_name}")
  end

  def daily_summary(team_validated, team_validated_no_id, user_count, athlete_profile_aggregate_count,  athlete_profile_count, invite_count, interest_count, unsubscribe_count, comment_count)
    @user_count = user_count
    @athlete_profile_aggregate_count = athlete_profile_aggregate_count
    @athlete_profile_count = athlete_profile_count
    @invite_count = invite_count
    @interest_count = interest_count
    @unsubscribe_count = unsubscribe_count
    @comment_count = comment_count
    @team_validated = team_validated
    @team_validated_no_id = team_validated_no_id

    to_emails = "julie.kent@backyardlion.com, devan.moylan@backyardlion.com"
    mail(:to => to_emails,
         :subject => "Daily summary for #{Date.today}")
  end

  def welcome_email(athlete_profile)
    @athlete_email = athlete_profile.user.email
    @athlete_first_name = athlete_profile.user.first_name
    @athlete_sport = athlete_profile.athlete_experiences.first.sport rescue nil
    @athlete_high_school = athlete_profile.school_name

    mail(:to => @athlete_email,
         :subject => "You're in :) | Plus, a quick question....",
         :from => "devan@backyardlion.com")
  end

  def challenge_promotion(athlete_profile)
    athlete = AthleteProfile.find(athlete_profile)
    @user = athlete.user.full_name
    @school = athlete.school_name
    @sport = athlete.athlete_experiences.first.sport
    @position = athlete.athlete_experiences.first.position rescue nil
    long_url = "https://www.backyardlion.com/athlete_profiles/#{athlete_profile}"
    @bitly = Bitly.client.shorten(long_url).short_url

    unless athlete.twitter_url.blank?
      @twitter = athlete.twitter_url
    end

    unless athlete.facebook_url.blank?
      @facebook = athlete.facebook_url
    end

    to_emails = "julie.kent@backyardlion.com, devan.moylan@backyardlion.com"
    mail(:to => to_emails,
         :subject => "#{@user} has completed the challenge!")

  end

  def gmail_challenge_promotion(athlete_profile)
    athlete = AthleteProfile.find(athlete_profile)
    @user = athlete.user.full_name

    to_emails = "julie.kent@backyardlion.com, devan.moylan@backyardlion.com"
    mail(:to => to_emails,
         :subject => "#{@user} has completed the Gmail Challenge!")
  end

  def information_request(request, profile)
    @user_full_name = User.find(profile.user_id).full_name
    @requested_info = request.athlete_profile_field.to_a.join(",")

    @requester = User.find(request.user_id).full_name
    team = Team.find(request.team_id)
    @college = College.find(team.college_id).name

    to_emails = "julie.kent@backyardlion.com, devan.moylan@backyardlion.com"
    mail(:to => to_emails,
         :subject => "#{@requester} has requested info from #{@user_full_name}")
  end

  def three_questions_email(athlete_profile)
    @athlete_email = athlete_profile.user.email
    @athlete_city = athlete_profile.city
    @athlete_first_name = athlete_profile.user.first_name
    @athlete_sport = athlete_profile.athlete_experiences.first.sport rescue nil 
    @athlete_high_school = athlete_profile.school_name

    mail(:to => @athlete_email,
         :subject => "Three questions",
         :from => "devan@backyardlion.com")
  end

  def community_promotion_admin(user_requesting)
    @user_full_name = user_requesting.full_name

    to_emails = "julie.kent@backyardlion.com, devan.moylan@backyardlion.com"
    mail(:to => to_emails,
         :subject => "#{@user_full_name} has requested community promotion")
  end

  def faq_email(athlete_profile)
    @athlete_email = athlete_profile.user.email
    @athlete_city = athlete_profile.user.city
    @athlete_first_name = athlete_profile.user.first_name
    @athlete_sport = athlete_profile.athlete_experiences.first.sport


    mail(:to => @athlete_email,
         :subject => "Because you're a member: 3 simple ways to generate opportunities on Backyard Lion",
         :from => "devan@backyardlion.com")
  end

end