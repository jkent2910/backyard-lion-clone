class CollegesController < ApplicationController
  before_action :ensure_byl_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_college, only: [:show, :edit, :update, :destroy]

  def index
    @colleges = College.all
  end

  def show
  end

  def new
    @college = College.new
  end

  def edit
  end

  def create
    @college = College.new(college_params)

    respond_to do |format|
      if @college.save

        format.html { redirect_to @college, notice: 'College created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @college.update(college_params)
        format.html { redirect_to @college, notice: "College updated" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
  end

  private

  def set_college
    @college = College.find(params[:id])
  end

  def ensure_byl_admin
    unless current_user.byl_admin?
      redirect_to root_path, notice: "You are not allowed to perform that action."
    end
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def college_params
    params.require(:college).permit(:name, :nickname, :logo, :state, :city, :enrollment, :campus_setting, :school_type, :tuition_in_state, :tuition_out_of_state,
                                    :email_prefix, teams_attributes: [:id, :sport_name, :sport_division, :sport_conference, :playing_style, :playing_time, :coach_prestige,
                                    :conference_prestige, :pro_potential, :program_tradition, :television_exposure, :athletic_facilities, :championship_contender,
                                    :stadium_atmosphere, :academic_prestige, :campus_lifestyle, :coach_stability, :_destroy])
  end
end