class AthleteProfilesController < ApplicationController

  require 'will_paginate/array'
  require 'will_paginate/collection'

  include StateHelper
  include TwitterHelper
  decorates_assigned :athlete_profile

  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy, :athlete_news_feed, :gmail_contacts]
  before_action :set_athlete_profile, only: [:request_feedback, :delete_my_profile, :remove_profile, :twitter_player_card, :stand_out, :stand_out_challenge, :challenge_step_one, :challenge_step_two, :challenge_step_three, :challenge_step_four, :challenge_step_five, :challenge_step_six, :challenge_step_seven, :challenge_step_eight, :challenge_step_nine, :challenge_step_ten, :challenge_step_eleven, :challenge_step_twelve, :challenge_step_thirteen, :challenge_step_fourteen, :challenge_step_fifteen, :challenge_step_sixteen, :challenge_step_seventeen, :challenge_step_eighteen, :social_media_shoutout, :extra_promotion, :athlete_commitment, :delete_commitment, :show, :edit, :update, :destroy, :express_interest, :follow_team, :unfollow_team, :remove_interest, :remove_skill_endorsement, :profile_views, :privacy_settings, :calculate_profile_strength, :set_athlete_height]
  before_action :check_for_existing_profile, only: [:new, :create]
  before_action :ensure_athlete_ownership, only: [ :stand_out_challenge, :challenge_step_one, :challenge_step_two, :challenge_step_three, :challenge_step_four, :challenge_step_five, :challenge_step_six, :challenge_step_seven, :challenge_step_eight, :challenge_step_nine, :challenge_step_ten, :challenge_step_eleven, :challenge_step_twelve, :challenge_step_thirteen, :challenge_step_fourteen, :challenge_step_fifteen, :challenge_step_sixteen, :challenge_step_seventeen, :challenge_step_eighteen, :top_ten, :stand_out, :athlete_commitment, :edit, :update, :destroy, :profile_views, :privacy_settings]
  after_action :set_athlete_height, only: [:update, :create]
  after_action :calculate_profile_strength, only: [:update, :create]
  before_action :check_for_changed_contacts, only: [:update]

  def index

    @location_search_results = []

    unless params[:q].nil?
      if params[:miles].present? && params[:zipcode].blank?
        redirect_to athlete_profiles_path, notice: "To search by location, you must enter both a zipcode and a mile radius"
      elsif params[:zipcode].present? && params[:miles].blank?
        if !/^[A-z]/.match(params[:zipcode]).nil?
          redirect_to athlete_profiles_path, notice: "You must enter a valid zipcode"
        else
          params[:miles] = 0
          @location_search_results = AthleteProfile.near(params[:zipcode], params[:miles])
        end
      elsif params[:miles].present? && params[:zipcode].present?
        if !/^[A-z]/.match(params[:zipcode]).nil?
          redirect_to athlete_profiles_path, notice: "You must enter a valid zipcode"
        elsif !/^[A-z]/.match(params[:miles]).nil?
          redirect_to athlete_profiles_path, notice: "You must enter a valid number of miles"
        else
          @location_search_results = AthleteProfile.near(params[:zipcode], params[:miles])
        end
      end



      if params[:q][:athlete_height_gteq].present? || params[:q][:athlete_height_lteq].present?
        string_height_gt = params[:q][:athlete_height_gteq].to_s.split(".").map(&:to_i) unless params[:q][:athlete_height_gteq].nil?
        string_lt = params[:q][:athlete_height_lteq].to_s.split(".").map(&:to_i) unless params[:q][:athlete_height_lteq].nil?

        gt_inches = string_height_gt.first * 12 + string_height_gt.last unless string_height_gt.empty?
        lt_inches = string_lt.first * 12 + string_lt.last unless string_lt.empty?
        params[:q][:athlete_height_gteq] = gt_inches
        params[:q][:athlete_height_lteq] = lt_inches
      end
    end

    @athlete_search = AthleteProfile.ransack(params[:q])

    if @location_search_results.empty? && params[:miles].present? && params[:zipcode].present?
      @athlete_profiles = [].paginate(:page => params[:page])
    else
      if @location_search_results.empty?
        @athlete_profiles = @athlete_search.result(:distinct => true).paginate(:page => params[:page])
      else
        @athlete_profiles = @athlete_search.result(:distinct => true).merge(@location_search_results).paginate(:page => params[:page])
      end
    end
  end

  def show
    if user_signed_in? && current_user.id != @athlete_profile.user_id
      unless current_user.user_type == "byl_admin"
        create_profile_notification(current_user, @athlete_profile)
      end
    end

    @athlete_photos = @athlete_profile.athlete_photos
  end

  def new
    @athlete_profile = AthleteProfile.new
    @athlete_profile.athlete_experiences.build
  end

  def edit
  end

  def create
    @athlete_profile = AthleteProfile.new(athlete_profile_params)
    @athlete_profile.user = current_user

    respond_to do |format|
      if @athlete_profile.save
        unless @athlete_profile.contacts.blank?
          @athlete_profile.invite_contacts(@athlete_profile.contacts.split(","))
        end

        # Send welcome e-mail 12 hours after sign-up
        NewUserMailer.delay(run_at: Time.current + 12.hours).welcome_email(@athlete_profile)

        # Send 3-question e-mail 168 hours after sign-up
        NewUserMailer.delay(run_at: Time.current + 165.hours).three_questions_email(@athlete_profile)

        # Check if there are any users that go to the same high school
        NotificationMailer.same_high_school(@athlete_profile.school_name, @athlete_profile.id).deliver_later

        format.html { redirect_to invite_contacts_athlete_profile_path(@athlete_profile), notice: 'Great!  Your profile has been created!', method: :get }
        format.json { render :show, status: :created, location: @athlete_profile }
      else
        format.html { render :new }
        format.json { render json: @athlete_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def invite_contacts
    @athlete_profile = AthleteProfile.find(params[:id])
  end

  def update
    respond_to do |format|
      if @athlete_profile.update(athlete_profile_params)

        if params[:video].present?
          experience = AthleteExperience.find(params[:athlete_profile][:athlete_experience_id])
          Video.create(name: params[:video][:name], url: params[:video][:url], description: params[:video][:description], athlete_experience_id: experience.id)
        end

        if params[:images]
          params[:images].each { |image|
            @athlete_profile.athlete_photos.create(image: image)
          }
        end

        if params[:stand_out].present?
          format.html { redirect_to challenge_step_two_athlete_profile_path(@athlete_profile), notice: "Great!  Your profile has been updated" }
          format.json { render :show, status: :ok, location: @athlete_profile }
        elsif params[:challenge_step_four].present?
          format.html { redirect_to challenge_step_four_athlete_profile_path(@athlete_profile), notice: "Great!  Your profile has been updated" }
          format.json { render :show, status: :ok, location: @athlete_profile }
        elsif params[:challenge_step_five].present?
          format.html { redirect_to challenge_step_five_athlete_profile_path(@athlete_profile), notice: "Great!  Your profile has been updated" }
          format.json { render :show, status: :ok, location: @athlete_profile }
        elsif params[:challenge_step_seven].present?
          format.html { redirect_to challenge_step_seven_athlete_profile_path(@athlete_profile), notice: "Great!  Your profile has been updated" }
          format.json { render :show, status: :ok, location: @athlete_profile }
        elsif params[:challenge_step_nine].present?
          format.html { redirect_to challenge_step_nine_athlete_profile_path(@athlete_profile), notice: "Great!  Your profile has been updated" }
          format.json { render :show, status: :ok, location: @athlete_profile }
        elsif params[:challenge_step_ten].present?
          format.html { redirect_to challenge_step_ten_athlete_profile_path(@athlete_profile), notice: "Great!  Your profile has been updated" }
          format.json { render :show, status: :ok, location: @athlete_profile }
        elsif params[:challenge_step_twelve].present?
          format.html { redirect_to challenge_step_twelve_athlete_profile_path(@athlete_profile), notice: "Great!  Your profile has been updated" }
          format.json { render :show, status: :ok, location: @athlete_profile }
        elsif params[:invite_contacts_new].present?
          format.html { redirect_to teams_path(q: {"sport_name_eq" => @athlete_profile.athlete_experiences.first.sport}), notice: 'Great! Your profile has been updated!', method: :get }
          format.json { render :show, status: :ok, location: @athlete_profile }
        else
          format.html { redirect_to @athlete_profile, notice: "Great!  Your profile has been updated" }
          format.json { render :show, status: :ok, location: @athlete_profile }
        end

      else
        format.html { render :edit }
        format.json { render json: @athlete_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    NewUserMailer.deleted_athlete(@athlete_profile.to_param).deliver_later

    @athlete_profile.destroy

    respond_to do |format|
      format.html { redirect_to teams_path, notice: "Your profile has been deleted" }
      format.json { head :no_content }
    end
  end

  def privacy_settings
  end

  def update_notifications
    @athlete_profile = AthleteProfile.find(params[:id])
    @athlete_profile.athlete_notifications.map { |n| n.update_attributes( { :viewed => true}) }
    render :nothing => true
  end

  def update_bronze_challenge
    @athlete_profile = AthleteProfile.find(params[:athlete_profile])
    @athlete_profile.update_attributes(finish_bronze: true)
    render :nothing => true
  end

  def rate_athletes
    @athlete_profile = AthleteProfile.find(params[:id])
    sport = @athlete_profile.athlete_experiences.first.sport
    @videos = []
    Video.all.each do |v|
      unless v.athlete_experience_id.nil?
        experience = AthleteExperience.find(v.athlete_experience_id)
        if experience.sport == sport
          @videos << v
        end
      end
    end

    @videos = @videos.shuffle

    page = params[:page] || 1
    per_page = 1
    @videos = WillPaginate::Collection.create(page, per_page, @videos.length) do |pager|
      pager.replace @videos[pager.offset, pager.per_page].to_a
    end
  end

  def express_interest
    team = Team.find(params[:team_id])
    @athlete_profile = AthleteProfile.find(params[:athlete_profile])
    @athlete_profile.express_interest(team.id, current_user.id)

    render :nothing => true
  end

  def remove_interest
    team = Team.find(params[:team_id])
    @athlete_profile = AthleteProfile.find(params[:athlete_profile])
    @athlete_profile.remove_interest(team)

    render :nothing => true
  end

  def remove_skill_endorsement
    skill = Skill.find(params[:skill_id])
    if current_user.athlete?
      endorser = AthleteProfile.find(params[:endorser_id])
    elsif current_user.supporter?
      endorser = User.find(params[:endorser_id])
    end
    @athlete_profile.remove_skill_endorsement(skill, endorser)
    redirect_to athlete_profile_path(@athlete_profile)
  end

  def endorse_skill
    skill = Skill.find(params[:skill_id])
    @athlete_profile = AthleteProfile.find(params[:id])

    if current_user.athlete?
      endorser = AthleteProfile.find(params[:endorser_id])
      @athlete_profile.endorse_skill(skill, endorser, "athlete")
    elsif current_user.supporter?
      endorser = User.find(params[:endorser_id])
      @athlete_profile.endorse_skill(skill, endorser, "supporter")
    end

    redirect_to athlete_profile_path(@athlete_profile)
  end


  def follow_team
    team = Team.find(params[:team_id])
    @athlete_profile = AthleteProfile.find(params[:athlete_profile])
    @athlete_profile.follow_team(team)
    render :nothing => true
  end

  def unfollow_team
    team = Team.find(params[:team_id])
    @athlete_profile = AthleteProfile.find(params[:athlete_profile])
    @athlete_profile.unfollow_team(team)
    render :nothing => true
  end

  def profile_views
    @athlete_notifications = @athlete_profile.athlete_notifications.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
  end

  def calculate_profile_strength
    count = 0
    total = 110
    @athlete_profile.attributes.each do |key, value|
      unless value.blank?
        count = count + 1
      end
    end

    # Check coach
    unless @athlete_profile.coaches.empty?
      coach = @athlete_profile.coaches.first
      coach.attributes.each do |key, value|
        unless value.blank?
          count = count + 1
        end
      end
    end

    # Check experience
    unless @athlete_profile.athlete_experiences.empty?
      experience = @athlete_profile.athlete_experiences.first
      experience.attributes.each do |key, value|
        unless value.blank?
          count = count + 1 
        end
      end
    end

    profile_strength_profile_attributes = ((count.to_f / total.to_f) * 100) * 0.5

    athlete_notification = @athlete_profile.athlete_notifications

    endorsement_count =  athlete_notification.where(notification_type: "skill_endorsement").count
    endorsement_trust_rating = endorsement_count * 5

    rating_count =  athlete_notification.where(notification_type: "rating").count
    rating_trust_rating = rating_count * 5

    recommendation_count =  athlete_notification.where(notification_type: "recommendation").count
    recommendation_trust_rating = recommendation_count * 10

    total_rating = recommendation_trust_rating + rating_trust_rating + endorsement_trust_rating

    if total_rating > 50
      # Set equal to 50 as ceiling
      total_rating = 50
    end

    profile_strength_trust_attributes = ((total_rating.to_f / 50.to_f) * 100) * 0.5

    total_strength = profile_strength_profile_attributes + profile_strength_trust_attributes
    
    @athlete_profile.update_attributes(profile_strength: total_strength)
  end

  def create_profile_notification(current_user, athlete_profile)

    if current_user.athlete?
      unless AthleteNotification.where('athlete_profile_id = ? AND notification_id = ? AND notification_type = ?', athlete_profile.id, current_user.id, "profile_view").any?
        AthleteNotification.create!(athlete_profile_id: athlete_profile.id, notification_type: "profile_view", notification_id: current_user.id)
        unless athlete_profile.profile_view_email == false
          NotificationMailer.profile_view_notification(athlete_profile.id, current_user.id).deliver_later
        end
      end
    elsif current_user.coach?
      unless AthleteNotification.where('athlete_profile_id = ? AND notification_id = ? AND notification_type = ?', athlete_profile.id, current_user.team_id, "team_profile_view").any?
        AthleteNotification.create!(athlete_profile_id: athlete_profile.id, notification_type: "team_profile_view", notification_id: current_user.team_id)
        unless athlete_profile.profile_view_email == false
          NotificationMailer.profile_view_notification(athlete_profile.id, current_user.id).deliver_later
        end
      end
    end

  end

  def set_athlete_height
    feet = @athlete_profile.height_feet.to_i
    inches = @athlete_profile.height_inches.to_i

    feet_inches = feet * 12

    athlete_height = feet_inches + inches
    @athlete_profile.update(athlete_height: athlete_height)
  end

  def register_rating
    athlete_profile_id = AthleteExperience.find(params[:id]).athlete_profile_id rescue nil
    athlete_profile = AthleteProfile.find(athlete_profile_id) rescue nil

    if AthleteRating.where('rater_id = ? AND athlete_experience_id = ?', params[:user_id], params[:id]).exists?
       delete_ratings = AthleteRating.where('rater_id = ? AND athlete_experience_id = ?', params[:user_id], params[:id]).destroy_all
       rating = AthleteRating.create(rater_id: params[:user_id], rating: params[:rating], athlete_experience_id: params[:id])
       delete_ratings.each do |rating|
         notification = AthleteNotification.where(notification_id: rating.id)
         notification.destroy_all
       end
       AthleteNotification.create(athlete_profile_id: AthleteExperience.find(params[:id]).athlete_profile_id, notification_type: "rating", notification_id: rating.id)
       unless athlete_profile.profile_view_email == false
         NotificationMailer.rating_notification(AthleteExperience.find(params[:id]).athlete_profile_id).deliver_later
       end

    else
       rating = AthleteRating.create(rater_id: params[:user_id], rating: params[:rating], athlete_experience_id: params[:id])
       AthleteNotification.create(athlete_profile_id: AthleteExperience.find(params[:id]).athlete_profile_id, notification_type: "rating", notification_id: rating.id)
       unless athlete_profile.profile_view_email == false
         NotificationMailer.rating_notification(AthleteExperience.find(params[:id]).athlete_profile_id).deliver_later
       end
    end
    render :nothing => true
  end

  def check_ratings
    athlete_profile = AthleteProfile.find(params[:athlete_profile])
    experience_hash = {}
    athlete_profile.athlete_experiences.each do |experience|
      if AthleteRating.where('rater_id = ? AND athlete_experience_id = ?', params[:user_id], experience.id).exists?
        rating = AthleteRating.where('rater_id = ? AND athlete_experience_id = ?', params[:user_id], experience.id).first
        experience_hash.merge!(experience.id => rating.rating)
      end
    end

    respond_to do |format|
      format.json {render json: experience_hash}
    end
  end

  def athlete_news_feed
    @athlete_profile = AthleteProfile.find(current_user.athlete_profile.id)
    @activities = Activity.all.order(created_at: 'desc').paginate(:page => params[:page])
    @maximum_length = Activity.validators_on( :media_comment ).first.options[:maximum]
  end

  def athlete_commitment
    @athlete_profile.update_attributes(school_commit: params[:school_commit], sport_commit: params[:sport_commit])
    Activity.create(activity_type: "new_commitment", athlete_profile_id: @athlete_profile.id, associated_activity_id: @athlete_profile.id)
  end

  def delete_commitment
    @athlete_profile.update_attributes(school_commit: nil, sport_commit: nil)
    activity = Activity.where("activity_type = ? AND athlete_profile_id = ?", 4, @athlete_profile.id)
    activity.each do |a|
      a.destroy
    end
    redirect_to athlete_profile_path(@athlete_profile), notice: "Your commitment has been removed."
  end

  def check_for_changed_contacts
    unless athlete_profile_params[:contacts].blank?
      unless @athlete_profile.contacts == athlete_profile_params[:contacts]
        @athlete_profile.invite_contacts(athlete_profile_params[:contacts].split(","))
      end
    end
  end

  def update_athlete_contacts
    @athlete_profile = AthleteProfile.find(params[:athlete_profile_id])
    contacts = []
    contacts << params[:contact_1] unless params[:contact_1] == ""
    contacts << params[:contact_2] unless params[:contact_2] == ""
    contacts << params[:contact_3] unless params[:contact_3] == ""
    contacts << params[:contact_4] unless params[:contact_4] == ""
    contacts << params[:contact_5] unless params[:contact_5] == ""
    contacts << params[:contact_6] unless params[:contact_6] == ""

    unless contacts.empty?
      @athlete_profile.invite_contacts(contacts)
    end

    redirect_to athlete_profile_path(@athlete_profile), notice: "Great!  We've requested recommendations"
  end

  def invite_skill_endorsements
    EndorsementInvite.create(invited_by_user_id: params[:user_id], invite_sent_count: 1, email: params[:contact_1])
    user = User.find(params[:user_id])
    full_name = user.full_name

    long_url = "https://www.backyardlion.com/?invited_by=#{full_name}"
    bitly_url = Bitly.client.shorten(long_url).short_url

    if params[:contact_1].include? "@"
      InviteMailer.athlete_endorsement_mailer(params[:contact_1], user, bitly_url).deliver_later
    else
      @client = Twilio::REST::Client.new
      number = params[:contact_1].gsub(/([-() ])/, '')
      new_number = number.prepend("1")
      @client.messages.create(
          from: "13197748150",
          to: new_number,
          body: "#{full_name} has invited you to join Backyard Lion -- Create a profile for 100% free so you can start connecting with college coaches.  Join now: #{bitly_url}"
      )
    end

    athlete_profile = params[:athlete_profile_id]

    redirect_to challenge_step_eleven_athlete_profile_path(athlete_profile), notice: "Great!  We've sent the request"
  end

  def invite_coach_recommendation
    user = User.find(params[:user_id])
    full_name = user.full_name

    long_url = "https://www.backyardlion.com/?invited_by=#{full_name}"
    bitly_url = Bitly.client.shorten(long_url).short_url

    if params[:contact_1].include? "@"
      InviteMailer.athlete_coach_mailer(params[:contact_1], user, bitly_url).deliver_later
    else
      @client = Twilio::REST::Client.new
      number = params[:contact_1].gsub(/([-() ])/, '')
      new_number = number.prepend("1")
      @client.messages.create(
          from: "13197748150",
          to: new_number,
          body: "#{full_name} has invited you to join Backyard Lion -- Create a profile for 100% free so you can start connecting with college coaches.  Join now: #{bitly_url}"
      )
    end

    athlete_profile = params[:athlete_profile_id]

    redirect_to challenge_step_thirteen_athlete_profile_path(athlete_profile), notice: "Great!  We've sent the request"
  end

  def leave_video_feedback
    comment = Comment.create(body: params[:video_comment], video_id: params[:video_id], user_id: params[:user_id])

    athlete_profile = AthleteProfile.find(params[:athlete_profile_id])
    NotificationMailer.video_feedback(athlete_profile).deliver_later
    AthleteNotification.create(athlete_profile_id: athlete_profile.id, notification_type: "video_comment", notification_id: comment.id)

    feedback_giver = User.find(params[:user_id]).athlete_profile

    if params[:rate_athletes].present?
      redirect_to rate_athletes_athlete_profile_path(feedback_giver), notice: "Feedback saved!"
    elsif params[:newsfeed].present?
      redirect_to athlete_newsfeed_path, notice: "Feedback saved!"
    else
      redirect_to athlete_profile_path(athlete_profile), notice: "Feedback saved!"
    end
  end

  def request_feedback
    athlete_requesting_feedback = AthleteProfile.find(params[:athlete])

    if athlete_requesting_feedback.athlete_experiences.where("videos_count > ?", 0).size < 1
      redirect_to athlete_profile_path(@athlete_profile), notice: "You must have at least one video to request feedback"
    else
      athlete_requesting_feedback_from = @athlete_profile
      NotificationMailer.athlete_feedback_request(athlete_requesting_feedback, athlete_requesting_feedback_from).deliver_later
      redirect_to athlete_profile_path(@athlete_profile), notice: "We've sent your feedback request!", method: :get
    end
  end

  def request_community_promotion
    profiles = AthleteProfile.all.pluck(:id).sample(10)
    athlete = AthleteProfile.find(params[:athlete_profile])
    user_requesting = User.find(athlete.user_id)
    long_url = "https://www.backyardlion.com/athlete_profiles/#{params[:athlete_profile]}"
    bitly_url = Bitly.client.shorten(long_url).short_url

    profiles.each do |p|
      profile = AthleteProfile.find(p)
      unless profile.profile_view_email == false
        NotificationMailer.community_promotion(user_requesting, profile, bitly_url).deliver_later
      end
    end

    NewUserMailer.community_promotion_admin(user_requesting).deliver_later

    render :nothing => true

  end

  def request_additional_feedback
    experiences = AthleteExperience.where(sport: params[:sport]).pluck(:id).sample(5)
    athlete = AthleteProfile.find(params[:athlete_profile])

    if athlete.athlete_experiences.where("videos_count > ?", 0).size < 1
     # Don't send
    else
      unless experiences.empty?
        experiences.each do |e|
          request_from = AthleteExperience.find(e).athlete_profile
          unless request_from.profile_view_email == false
            NotificationMailer.athlete_feedback_request(athlete, request_from).deliver_later
          end
        end
      end

      NewUserMailer.feedback_request_sent(athlete).deliver_later
    end

    render :nothing => true

  end

  def promotion_contacts
    @athlete_profile = AthleteProfile.find(params[:id])
    contacts = params[:promo_contacts].split(",")

    unless contacts.empty?
      @athlete_profile.invite_contacts(contacts)
    end

    redirect_to stand_out_athlete_profile_path(@athlete_profile), notice: "Great!  We've sent invitations"
  end

  def request_promotion
    @athlete_profile = AthleteProfile.find(params[:athlete_profile_id])
    twitter_handle = params[:twitter_handle]
    facebook_handle = params[:facebook_name]
    accomplishment = params[:accomplishment]
    long_url = "https://www.backyardlion.com/athlete_profiles/#{params[:athlete_profile_id]}"
    bitly_url = Bitly.client.shorten(long_url).short_url

    NotificationMailer.delay(run_at: Time.current + 36.hours).promotion_notification(@athlete_profile.id)
    NewUserMailer.delay(run_at: Time.current + 84.hours).promotion_notification(@athlete_profile.id, bitly_url, twitter_handle, facebook_handle, accomplishment)

    redirect_to athlete_profile_path(@athlete_profile), notice: "Great!  Your request has been submitted for approval"
  end

  def player_card
    @athlete_profile = AthleteProfile.find(params[:id])
    @user = User.find(@athlete_profile.user_id)
    @first_experience = @athlete_profile.athlete_experiences.first
  end

  def twitter_player_card
    @athlete_profile = AthleteProfile.find(params[:id])
    @user = User.find(@athlete_profile.user_id)
    @first_experience = @athlete_profile.athlete_experiences.first
  end

  def remove_profile
  end

  def delete_my_profile
    reason = params[:why_remove]

    NewUserMailer.deleted_athlete(@athlete_profile.to_param, reason).deliver_later

    @athlete_profile.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Your profile has been deleted" }
      format.json { head :no_content }
    end
  end


  def stand_out
    @ratings = AthleteRating.where(rater_id: current_user.id).count
    @invites = InvitedContact.where(invited_by_user_id: current_user.id).count
    long_url = "https://www.backyardlion.com/athlete_profiles/#{@athlete_profile.id}"
    @bitly_url = Bitly.client.shorten(long_url).short_url
    @commitments = Activity.where(activity_type: 4).limit(5)
  end

  def stand_out_challenge
    @athlete_profile = AthleteProfile.find(params[:id])
    @first_experience = @athlete_profile.athlete_experiences.first
  end

  def challenge_step_one
    @interests_count = @athlete_profile.interests.count
    @athlete = @athlete_profile.user.first_name
    @first_experience_sport = @athlete_profile.athlete_experiences.first.sport
    @team_count = Team.where(sport_name: @first_experience_sport).count
  end

  def challenge_step_two
    @skills_count = @athlete_profile.skills.count
    @athlete = @athlete_profile.user.first_name
    @first_experience = @athlete_profile.athlete_experiences.first
  end

  def challenge_step_three
    @first_experience_sport = @athlete_profile.athlete_experiences.first.sport
  end

  def challenge_step_four
    @first_experience_sport = @athlete_profile.athlete_experiences.first.sport
  end

  def challenge_step_five
  end

  def challenge_step_six
    @first_experience_sport = @athlete_profile.athlete_experiences.first.sport
    if user_signed_in? && current_user.athlete?
=begin
      challenge_promotion_tweet(@athlete_profile.to_param)
      challenge_promotion_facebook(@athlete_profile.to_param)
=end
      NotificationMailer.challenge_sent(@athlete_profile.to_param).deliver_later
    end
  end

  def challenge_step_seven
    @first_experience_sport = @athlete_profile.athlete_experiences.first.sport
  end

  def challenge_step_eight
  end

  def challenge_step_nine
    @first_experience_sport = @athlete_profile.athlete_experiences.first.sport
  end

  def challenge_step_ten
  end

  def challenge_step_eleven
    @skill_endorsement_invite_count = EndorsementInvite.where(invited_by_user_id: current_user.id).count
    @first_experience_sport = @athlete_profile.athlete_experiences.first.sport
  end

  def challenge_step_twelve
  end

  def challenge_step_thirteen
  end

  def challenge_step_fourteen
    if @athlete_profile.challenge_step_fourteen_time.blank?
      @athlete_profile.update_attributes(challenge_step_fourteen_time: DateTime.now)
      NotificationMailer.delay(run_at: 36.hours.from_now).challenge_time_clock_mailer(@athlete_profile)
    end

    @comment_count = Comment.where(user_id: current_user.id).count
  end

  def challenge_step_fifteen
    @team_views = AthleteNotification.where("athlete_profile_id = ? AND notification_type = ?", @athlete_profile.id, "team_profile_view").count
    @interests_count = @athlete_profile.interests.count
  end

  def challenge_step_sixteen
  end

  def challenge_step_seventeen
  end

  def challenge_step_eighteen
    @first_experience_sport = @athlete_profile.athlete_experiences.first.sport
    NewUserMailer.challenge_promotion(@athlete_profile.to_param).deliver_later
  end

  def social_media_shoutout
    if user_signed_in? && current_user.athlete?
      # challenge_promotion_tweet(@athlete_profile.to_param)
      redirect_to athlete_profile_path(@athlete_profile), notice: "Thanks for completing the challenge!", method: :get
    end
  end

  def extra_promotion
    redirect_to athlete_profile_path(@athlete_profile), notice: "Thanks for completing the challenge!", method: :get
  end

  def gmail_contacts
    @contacts = request.env['omnicontacts.contacts']
    unless @contacts.nil? || current_user.nil? 
      user = current_user.id
      user_first_name = User.find(user).first_name
      user_email = User.find(user).email
      minutes_counter = 1
      long_url = "https://www.backyardlion.com/?invited_by=#{user}"
      bitly_url = Bitly.client.shorten(long_url).short_url
      @contacts.each do |c|
        unless c[:email].blank?
          InvitedContact.create(email: c[:email], invited_by_user_id: user, invite_sent_count: 1)
          InviteMailer.delay(run_at: Time.current + minutes_counter.minutes).gmail_invite_mailer(c[:email], c[:first_name], user_first_name, user_email, bitly_url)
        end
        minutes_counter = minutes_counter + 5
      end
    end
    unless current_user.nil?
      if !current_user.athlete_profile.nil? && current_user.sign_in_count > 1
        athlete = current_user.athlete_profile
        NewUserMailer.gmail_challenge_promotion(current_user.athlete_profile.to_param).deliver_later
        redirect_to stand_out_athlete_profile_path(athlete), notice: "Great!  We've requested assistance from your contacts!"
      else
        athlete = current_user.athlete_profile
        redirect_to invite_contacts_athlete_profile_path(athlete), notice: "Great!  We've requested assistance from your contacts!"
      end
    end
  end

  def top_ten
    @athlete_profile = AthleteProfile.find(params[:id])
  end

  def unsubscribe_invite
    contact = InvitedContact.find_by(email: params[:email])
    contact.update_attributes(invite_sent_count: 6)
    redirect_to root_url, notice: "You've been unsubscribed!"
  end

  def create_athlete_newsfeed_item
    Activity.create!(activity_type: "athlete_media", athlete_profile_id: params[:athlete_profile_id], associated_activity_id: params[:athlete_profile_id],
                    media: params[:media], media_comment: params[:media_comment])

    redirect_to athlete_newsfeed_path, notice: "Newsfeed item added!"
  end

  private

  def ensure_byl_admin
    unless current_user.byl_admin?
      redirect_to root_path, notice: "You're not allowed to perform that action."
    end
  end

  def player_card_rights
    unless user_signed_in? && (current_user == AthleteProfile.find(params[:id]).user || current_user.byl_admin?)
      redirect_to teams_path, notice: "You are not allowed to perform that action."
    end
  end

  def set_athlete_profile
    @athlete_profile = AthleteProfile.find(params[:id])
  end

  def check_for_existing_profile
    if current_user.athlete_profile
      redirect_to current_user.athlete_profile, notice: "You have already created a profile."
    end
  end

  def ensure_athlete_ownership
    if current_user != AthleteProfile.find(params[:id]).user
      redirect_to teams_path, notice: "You are not allowed to perform that action."
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def athlete_profile_params
    params.fetch(:athlete_profile, {}).permit(:contacts, :contacts_invited, :school_commit, :sport_commit, :academic_info_privacy, :contact_info_privacy, :school_name, :graduation_year, :activities_societies,
                                            :sat_2_total, :sat_2_math, :sat_2_reading, :guardian_twitter, :guardian_facebook, :second_guardian_twitter, :second_guardian_facebook,
                                            :sat_2_writing, :psat_total, :honor_classes, :preferred_major, :cum_gpa_score, :cum_gpa_out_of,
                                            :cum_gpa_scale, :core_gpa_score, :core_gpa_out_of, :weighted_gpa_score, :weighted_gpa_out_of,
                                            :class_rank, :class_rank_out_of, :weighted_class_rank, :weighted_class_rank_out_of, :sat_total,
                                            :sat_math, :sat_reading, :sat_writing, :act_total, :preferred_method_contact, :primary_phone,
                                            :primary_phone_type, :secondary_phone, :secondary_phone_type, :primary_email, :secondary_email,
                                            :facebook_url, :twitter_url, :instagram_url, :guardian_relationship, :guardian_first_name,
                                            :guardian_last_name, :guardian_primary_phone, :guardian_primary_phone_type, :guardian_secondary_phone,
                                            :guardian_secondary_phone_type, :guardian_primary_email, :guardian_edu_level, :guardian_two_relationship,
                                            :guardian_two_first_name, :guardian_two_last_name, :guardian_two_primary_phone, :guardian_two_primary_phone_type,
                                            :guardian_two_secondary_phone, :guardian_two_secondary_phone_type, :guardian_two_primary_email,
                                            :guardian_two_edu_level, :mailing_address, :mailing_city, :mailing_state, :mailing_zipcode,
                                            :gender, :country, :city, :state, :zipcode, :birthday, :profile_picture, :height_feet,
                                            :height_inches, :weight, coaches_attributes: [:id, :sport, :position, :first_name, :last_name, :primary_phone, :primary_phone_type, :secondary_phone, :secondary_phone_type, :email, :_destroy],
                                            athlete_experiences_attributes: [:id, :position, :secondary_position, :team_name, :level, :sport, :year_start, :year_end, :present, :city, :state, :description, :_destroy, videos_attributes: [:id, :url, :name, :description, :athlete_experience_id, :_destroy],
                                            statistics_attributes: [:id, :stat, :result, :result_unit, :year, :athlete_experience_id, :_destroy]],
                                            skills_attributes: [:id, :name, :skill_result, :units, :skill_result_year, :_destroy],
                                            athlete_awards_attributes: [:id, :name, :other_name, :issuer, :year, :description, :_destroy],
                                            factor_ratings_attributes: [:id, :factor_id, :factor_choice_id, :factor_preference_id, :_destroy],
                                            state_ratings_attributes: [:id, :state_id, :state_preference_id, :_destroy],
                                            region_ratings_attributes: [:id, :region_id, :region_preference_id, :_destroy],
                                            characteristic_answers_attributes: [:id, :athlete_profile_id, :characteristic_id, :athlete_answer, :_destroy])
  end
end