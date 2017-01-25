class UsersController < ApplicationController
  autocomplete :college, :name, :full => true, :extra_data => [:id]

  before_filter :ensure_signup_complete, only: [:new, :update]
  before_filter :ensure_user_rights, only: [:saved_athletes, :dashboard]
  before_filter :ensure_coach, only: [:saved_athletes, :dashboard]
  before_filter :ensure_team_validated, only: [:saved_athletes, :dashboard]




  def update
  
    @user = User.find(params[:id])

      if @user.update(user_params)

        if params[:college_email_address].present?
          token = @user.token

          # Update e-mail address
          user_college_email = params[:college_email_address]
          @user.update_attributes(email: user_college_email)

          college = College.find_by(name: params[:name])

          if college.nil?
            AdminMailer.new_coach_no_college(@user, params[:college_email_address]).deliver_later
          else
            # Try to find team
            team = Team.find_by(college_id: college.id, sport_name:params[:user][:coach_sport])
            if team.nil?
              AdminMailer.new_coach_no_team(@user, params[:user][:coach_sport]).deliver_later
            else
              @user.update_attributes(team_id: team.id)
            end
          end



          # Send confirm mailer
          prefix = params[:college_email_address].split("@").last
          if prefix.include? ".edu"
            user = @user.to_param
            ConfirmMailer.confirm_mailer(token, user_college_email, user, nil).deliver_now
            sign_out @user
            redirect_to root_path, notice: "Great!  We've sent you an e-mail to verify your identity"
          else
            redirect_to new_coach_user_path(@user), notice: "You must provide a .edu e-mail address"
          end

        end
      end
  end

  def finish_signup
    if request.patch? && params[:user]
      @user = User.find(params[:id])
      if @user.update(user_params)
        sign_in(@user, :bypass => true)
        if @user.sign_in_count < 2 && @user.athlete?
          redirect_to new_athlete_profile_path
        elsif @user.coach? && @user.team_id.nil?
          redirect_to new_coach_user_path(@user)
        else
          redirect_to teams_path, notice: "Profile successfully updated"
        end
      else
        @show_errors = true
      end
    end
  end

  def set_user_type
    if request.patch? && params[:user]
      @user = User.find(params[:id])
      if @user.update(user_params)
        sign_in(@user, :bypass => true)
        if @user.sign_in_count < 2 && @user.athlete?
          redirect_to new_athlete_profile_path
        elsif @user.coach? && @user.team_id.nil?
          redirect_to new_coach_user_path(@user)
        else
          redirect_to teams_path, notice: "Profile successfully updated"
        end
      else
        @show_errors = true
      end
    end
  end

  def awaiting_confirmation
    @user = current_user.id
  end

  def new_coach
    @user = User.find(params[:id])
  end

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email?
      redirect_to finish_signup_path(current_user)
    elsif current_user && current_user.user_type.nil?
      redirect_to set_user_type_path_path(current_user)
    end

  end

  def save_athlete
    @user = User.find(params[:user_id])
    athlete = AthleteProfile.find(params[:athlete_profile])
    @user.save_athlete(athlete)

    render :nothing => true
  end

  def unsave_athlete
    @user = User.find(params[:user_id])
    athlete = AthleteProfile.find(params[:athlete_profile])
    @user.unsave_athlete(athlete)
    render :nothing => true
  end

  def like_activity
    @user = User.find(params[:user_id])
    activity = Activity.find(params[:activity])
    @user.like_activity(activity)

    render :nothing => true
  end

  def unlike_activity
    @user = User.find(params[:user_id])
    activity = Activity.find(params[:activity])
    @user.unlike_activity(activity)
    render :nothing => true
  end

  def saved_athletes
    @user = User.find(params[:id])
    @team = Team.find(@user.team_id)
    @saved_athletes = @user.saved_athletes
  end

  def sort
    params[:order].each do |key,value|
      SavedAthlete.find(value[:id]).update_attribute(:rank_order,value[:position])
    end
    render :nothing => true
  end

  def dashboard
    @user = User.find(params[:id])
    @team = Team.find(@user.team_id)
    @college = College.find(@team.college_id)
    @interested_athletes_count = Interest.where(team_id: @team.id).count
    @notification_view_count = @team.team_notifications.where(notification_type: "athlete_profile_view").count
  end

  def resend_verification
    @user = User.find(params[:id])
    ConfirmMailer.confirm_mailer(@user.token, @user.email, @user, nil).deliver_later 
    sign_out @user
    redirect_to root_path, notice: "Thanks!  You should be receiving an e-mail soon with steps to confirm your account."
  end

  def view_notifications
    @team = Team.find(current_user.team_id)
    @college = College.find(@team.college_id)
    @team_notifications = @team.team_notifications.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
  end


  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:token, :coach_sport, :coach_position, :first_name, :last_name, :college_admin_flag, :college_id, :team_id, :team_validated, :user_type, :email, :password, :password_confirmation)
  end

  def ensure_user_rights
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to root_path, notice: "You don't have access to do that."
    end
  end

  def ensure_coach
    unless current_user.coach? || current_user.college_admin?
      redirect_to root_path, notice: "You don't have access to do that."
    end
  end

  def ensure_team_validated
    unless current_user.team_validated?
      redirect_to root_path, notice: "You must be validated with a team before you can access this."
    end
  end

end