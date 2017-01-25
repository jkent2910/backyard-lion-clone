class AthleteRequestsController < ApplicationController

  after_action :find_team_or_coach, only: [:create]

  def new
    @athlete_request = AthleteRequest.new
    @athlete_profile = AthleteProfile.find(params[:athlete_profile_id])
  end

  def create
    @athlete_request = AthleteRequest.new(athlete_request_params)
    @athlete_profile = AthleteProfile.find(params[:athlete_profile_id])

    respond_to do |format|
      if @athlete_request.save

        # Create athlete notifications and mailers 
        NotificationMailer.information_request_notification(@athlete_profile.id, @athlete_request.id).deliver_later
        AthleteNotification.create(athlete_profile_id: @athlete_profile.id, notification_id: @athlete_request.id, notification_type: "info_request")

        # Send Devan & Julie an e-mail too
        NewUserMailer.information_request(@athlete_request, @athlete_profile).deliver_later

        format.html { redirect_to athlete_profile_path(@athlete_profile), notice: 'Great! Your request has been sent.' }
      else
        format.html { render :new }
        format.json { render json: @athlete_request.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def athlete_request_params
    params.require(:athlete_request).permit(:athlete_profile_id, :team_id, :user_id, athlete_profile_field: [])
  end

  def find_team_or_coach
    team = Team.find(current_user.team_id)

    unless team.nil?
      @athlete_request.update_attributes(team_id: team.id)
    end
  end
end