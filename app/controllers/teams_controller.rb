class TeamsController < ApplicationController

  before_action :set_team, only: [:show, :edit, :update, :destroy, :interested_athletes]
  before_action :ensure_team_ownership, only: [:edit, :update, :interested_athletes]
  before_action :ensure_coach, only: [:interested_athletes]
  before_action :ensure_admin, only: [:new, :create, :destroy]


  def index
    @q = Team.ransack(params[:q])
    @teams = @q.result.paginate(:page => params[:page]).order(:sport_division, :college_id)

    if user_signed_in? && current_user.athlete? && !current_user.athlete_profile.nil?
      @athlete = current_user.athlete_profile
      if @athlete.athlete_experiences.empty?
        @athlete_experience = AthleteExperience.first
      else
        @athlete_experience = AthleteExperience.where(athlete_profile_id: @athlete.id).first rescue nil
      end
    else
      @athlete_experience = AthleteExperience.first
    end
  end

  def show
    @college = College.find(@team.college_id)
    @majors = CollegeMajor.where(college_id: @college.id)
    @most_popular = @majors.where(most_popular: true)

    if user_signed_in? && current_user.athlete?
      create_team_profile_notification(current_user, @team)
    end



  end

  def new
    @team = Team.new
    @college = College.find(params[:college_id])
  end

  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to dashboard_user_path(current_user), notice: 'Team created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @college = College.find(@team.college_id)
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to dashboard_user_path(current_user), notice: "Team updated" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_user_path(current_user), notice: "Team deleted" }
      format.json { head :no_content }
    end
  end

  def interested_athletes
    @interested_athletes = Interest.where(team_id: @team.id).ransack(params[:q])

    @athletes = @interested_athletes.result.paginate(:page => params[:page])
    @college_team = College.find(@team.college_id)
  end

  def update_notifications
    @team = Team.find(params[:id])
    @team.team_notifications.map { |n| n.update_attributes( { :viewed => true}) }
    render :nothing => true
  end


  private

  def set_team
    @team = Team.find(params[:id])
  end

  def ensure_coach
    if user_signed_in? && (current_user.byl_admin? || current_user.coach? || current_user.college_admin?)
      if current_user.coach? || current_user.college_admin?
        redirect_to root_path, notice: "You aren't allowed to perform that action" unless current_user.team_id == @team.id
      end
    elsif current_user.athlete?
      redirect_to root_path, notice: "You aren't allowed to perform that action"
    end
  end

  def create_team_profile_notification(current_user, team)
    unless TeamNotification.where('team_id = ? AND other_user_id = ? AND notification_type = ?', team.id, current_user.id, 1).any?
      TeamNotification.create!(team_id: team.id, notification_type: "athlete_profile_view", other_user_id: current_user.id)
    end


    if CoachContact.where(team_id: team.id).exists?
      contact = CoachContact.where(team_id: team.id)
      contact.each do |c|
        NotificationMailer.team_view(c.email, c.team_id, c.first_name).deliver_later
      end
    end

  end

  def ensure_team_ownership
    unless user_signed_in? && current_user.byl_admin?
      if (current_user.team_id != @team.id) || !current_user.team_validated?
        redirect_to root_path, notice: "You are not allowed to perform that action."
      end
    end
  end

  def ensure_admin
    unless user_signed_in? && current_user.byl_admin?
      redirect_to root_path, notice: "You are not allowed to perform that action."
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def team_params
    params.require(:team).permit(:sport_name, :sport_division, :sport_conference, :playing_style, :playing_time, :coach_prestige,
                                 :conference_prestige, :pro_potential, :program_tradition, :television_exposure, :athletic_facilities,
                                 :championship_contender, :stadium_atmosphere, :academic_prestige, :campus_lifestyle, :coach_stability,
                                 :sport_gender, :college_id, team_ratings_attributes: [:id, :team_id, :college_id, :factor_preference_id, :factor_id, :_destroy])
  end

end