class InterestsController < ApplicationController

  before_filter :ensure_athlete_profile_ownership

  def index
    @athlete_profile = AthleteProfile.find(params[:athlete_profile_id])
    @interests = @athlete_profile.interests.order("row_order ASC NULLS LAST").all
  end

  def sort
    params[:order].each do |key,value|
      Interest.find(value[:id]).update_attribute(:row_order,value[:position])
    end
    render :nothing => true
  end

  private

  def set_interest
    @interest = Interest.find(params[:id])
  end

  def interest_params
    params.require(:interest).permit(:interest_id, :team_id, :athlete_profile_id, :row_order, :interest_level, :row_order_position)
  end

  def ensure_athlete_profile_ownership
    if current_user != AthleteProfile.find(params[:athlete_profile_id]).user
      redirect_to teams_path, notice: "You are not allowed to perform that action."
    end
  end
end