class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_global_search_variable
  before_action :set_raven_context

  def after_sign_in_path_for(resource)
    if resource.athlete?
      if resource.athlete_profile.nil?
        :new_athlete_profile
      else
        teams_path
      end
    elsif resource.coach? || resource.college_admin?
      if resource.team_id.nil? || !resource.team_validated?
        if resource.sign_in_count <= 1
          new_coach_user_path(resource)
        else
          awaiting_confirmation_path
        end
      elsif resource.team_validated?
        dashboard_user_path(resource)
      end
    elsif resource.byl_admin?
      byl_admin_path
    else
      teams_path
    end
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

=begin

  def get_email_prefix(user_email)
    user_email.split("@").last
  end
=end

=begin
  def get_coach_college(email_prefix)
    College.all.each do |c|
      if c.email_prefix == email_prefix
        @coaches_college = c
      end
    end
  end
=end

  def set_global_search_variable
    @q = Team.search(params[:q])
    @athlete_search = AthleteProfile.ransack(params[:q])
  end

  private

  def set_raven_context
    Raven.user_context(id: session[:current_user_id]) # or anything else in session
    Raven.extra_context(params: params.to_hash, url: request.url)
  end

end
