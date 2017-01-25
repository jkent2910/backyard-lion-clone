class WelcomeController < ApplicationController

  before_action :ensure_admin_status, only: [:byl_admin_dashboard]

  def index
  end

  def signup
  end

  def login
  end

  def privacy
  end

  def terms_and_conditions
  end

  def home
  end
  
  def about
  end

  def forgot_password
  end

  def byl_admin_dashboard
    @admin_athlete_search = User.where(user_type: 1).ransack(params[:q])
    @contacts_invited = AthleteProfile.sum(:contacts_invited)
    @average_contacts_invited = (@contacts_invited.to_f / AthleteProfile.count).round(2)
    
    respond_to do |format|
      format.html { @users = @admin_athlete_search.result.paginate(:page => params[:page])  }
      format.csv  { @users = @admin_athlete_search.result }
    end
  end


  private
  def ensure_admin_status
    unless user_signed_in? && current_user.byl_admin?
      redirect_to root_path, notice: "You aren't allowed to do that"
    end
  end

end
