class AthleteRecommendationsController < ApplicationController

  before_filter :cannot_reco_yourself, only: [:new, :create]
  before_filter :can_only_submit_one_reco, only: [:new, :create]

  def index
  end

  def show
  end

  def new
    @athlete_profile = AthleteProfile.find(params[:athlete_profile_id])
    @athlete_recommendation = @athlete_profile.athlete_recommendations.build
  end

  def edit
  end

  def create
    @athlete_profile = AthleteProfile.find(params[:athlete_profile_id])
    @athlete_recommendation = AthleteRecommendation.new(athlete_recommendation_params)
    respond_to do |format|
      if @athlete_recommendation.save
        create_notification(@athlete_profile, "recommendation", @athlete_recommendation.id)
        format.html { redirect_to athlete_profile_path(@athlete_profile), notice: 'Great! Your recommendation is created.' }
      else
        format.html { render :new }
        format.json { render json: @athlete_recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def create_notification(athlete_profile, notification_type, notification_id)
    AthleteNotification.create!(athlete_profile_id: athlete_profile.id, notification_type: notification_type, notification_id: notification_id)
    NotificationMailer.recommendation_notification(athlete_profile.id).deliver_later
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def athlete_recommendation_params
    params.require(:athlete_recommendation).permit(:athlete_profile_id, :giver_first_name, :giver_last_name, :giver_contact_info,
                                                   :giver_relationship, :giver_athlete_profile_id, :giver_position, :recommendation_text,
                                                   :athlete_experience_id)
  end

  def cannot_reco_yourself
    @athlete_profile = AthleteProfile.find(params[:athlete_profile_id])
    if user_signed_in?
      if current_user.id == AthleteProfile.find(params[:athlete_profile_id]).user_id
        redirect_to athlete_profile_path(@athlete_profile), notice: "You can't recommendation yourself"
      end
    end

  end

  def can_only_submit_one_reco
    @athlete_profile = AthleteProfile.find(params[:athlete_profile_id])
    if user_signed_in? && current_user.athlete?
      @athlete_recos = AthleteRecommendation.where("athlete_profile_id = ? AND athlete_experience_id = ?", params[:athlete_profile_id], params[:athlete_experience_id])
      if @athlete_recos.where(giver_athlete_profile_id: AthleteProfile.find_by(user_id: current_user.id)).any?
        redirect_to athlete_profile_path(@athlete_profile), notice: "You can only recommendation someone once"
      end
    end
  end
end