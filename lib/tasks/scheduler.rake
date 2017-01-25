 desc "Resend invite to invited contacts who haven't signed up"
  task resend_invite: :environment do

    # Get all invited contacts
    InvitedContact.all.each do |c|
      if User.where(email: c.email).empty?

        if c.invite_sent_count < 5
          user = User.find(c.invited_by_user_id).full_name
          long_url = "https://www.backyardlion.com/?invited_by=#{user}"
          InviteMailer.delay(run_at: Time.current + 168.hours).athlete_invite_mailer(user, c.email, long_url)
          old_count = c.invite_sent_count
          c.update_attributes(invite_sent_count: old_count + 1)
        end
      else
        c.destroy
      end
    end

    EndorsementInvite.all.each do |c|
      unless c.email.include? "@"
        if User.where(email: c.email).empty?

          if c.invite_sent_count < 5
            user = User.find(c.invited_by_user_id).full_name
            long_url = "https://www.backyardlion.com/?invited_by=#{user}"
            InviteMailer.delay(run_at: Time.current + 168.hours).athlete_endorsement_mailer(c.email, user, long_url)
            old_count = c.invite_sent_count
            c.update_attributes(invite_sent_count: old_count + 1)
          end
        else
          c.destroy
        end
      end
    end

    NewAthleteInvite.all.each do |a|

      # Check if user has signed up already
      if User.where(email: a.email).empty?

        # Check number of invites sent out
        if a.invite_count < 10

          # Check if last_invite_sent date is 30 days prior to today
          if a.last_invite_sent == (Date.today - 30.days)
            # Send f/up e-mail
            InviteMailer.follow_up_email(a).deliver_later

            # Increment last sent
            a.update_attributes(last_invite_sent: Date.today)
            # Increment invite count
            a.update_attributes(invite_count: a.invite_count + 1)
          end

        end
      end
    end
  end

 desc "Daily summary to BYL Admin"
  task daily_user_summary: :environment do
    user_count = User.where(created_at: (Time.now - 24.hours)..Time.now).count
    athlete_profile_aggregate_count = AthleteProfile.count
    athlete_profile_count = AthleteProfile.where(created_at: (Time.now - 24.hours)..Time.now).count
    invite_count = InvitedContact.where(created_at: (Time.now - 24.hours)..Time.now).count
    interest_count = Interest.where(created_at: (Time.now - 24.hours)..Time.now).count
    unsubscribe_count = InvitedContact.where(invite_sent_count: 6).count
    comment_count = Comment.all.count
    team_validated = User.where(team_validated: true).count
    team_validated_no_id = User.where("team_id = ? AND team_validated = ?", nil, true).count


    NewUserMailer.daily_summary(team_validated, team_validated_no_id, user_count, athlete_profile_aggregate_count, athlete_profile_count, invite_count, interest_count, unsubscribe_count, comment_count).deliver_later
  end

 desc "Profile strength to BYL Admin"
  task average_profile_strength: :environment do

    raw_scores = []
    raw_percentages = []
    AthleteProfile.all.each do |profile|
      video_score = 0
      # Calculate score for videos
      profile.athlete_experiences.each do |experience|
        if experience.videos.count >= 1
          video_score = 10
        end
      end

      if video_score > 10
        video_score = 10
      end

      # Calculate score for coaches
      if profile.coaches.count >= 1
        coach_score = 10
      else
        coach_score = 0
      end

      # Calculate score for awards
      if profile.athlete_awards.count >= 1
        award_score = 5
      else
        award_score = 0
      end

      # Calculate score for factor ratings
      num_factor_ratings = profile.factor_ratings.count
      if num_factor_ratings >= 14
        factor_rating_score = 10
      elsif num_factor_ratings >= 8
        factor_rating_score = 7
      elsif num_factor_ratings >= 4
        factor_rating_score = 4
      elsif num_factor_ratings >= 1
        factor_rating_score = 2
      elsif num_factor_ratings == 0
        factor_rating_score = 0
      end

      # Calculate score for region ratings
      num_region_ratings = profile.region_ratings.count
      if num_region_ratings >= 4
        region_rating_score = 10
      elsif num_region_ratings >= 1
        region_rating_score = 5
      elsif num_region_ratings == 0
        region_rating_score = 0
      end

      # Calculate score for state ratings
      num_state_ratings = profile.state_ratings.count
      if num_state_ratings >= 40
        state_rating_score = 10
      elsif num_state_ratings >= 30
        state_rating_score = 8
      elsif num_state_ratings >= 20
        state_rating_score = 6
      elsif num_state_ratings >= 10
        state_rating_score = 4
      elsif num_state_ratings >= 1
        state_rating_score = 2
      elsif num_state_ratings == 0
        state_rating_score = 0
      end

      # Calculate score for overall athlete profile
      count = 0
      profile.attributes.each do |k, v|
        unless v.blank?
          count = count + 1
        end
      end

      # Calculate total score
      # Total possible: 147 (92 + 55)
      athlete_score_raw = video_score + coach_score + award_score + factor_rating_score + region_rating_score + state_rating_score + count
      athlete_score_percent = (athlete_score_raw.to_f / 147.to_f) * 100

      raw_scores << athlete_score_raw
      raw_percentages << athlete_score_percent

    end

    overall_score_average = raw_scores.inject{ |sum, el| sum + el }.to_f / raw_scores.size
    overall_score_percentage = raw_percentages.inject { |sum, el| sum + el }.to_f / raw_percentages.size

    NewUserMailer.daily_profile_strength(overall_score_average, overall_score_percentage).deliver_later


  end



