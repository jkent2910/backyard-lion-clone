class RegistrationsController < Devise::RegistrationsController

  before_filter :check_if_email_already_exists, only: [:create]

  def new
    super
  end

  def index
    super
  end

  def show
    super
  end

  def edit
    super
  end

  def create
    build_resource(sign_up_params)

    if @user.save

      if request.env["HTTP_REFERER"].include? ("invited_by")
        @user.update_attributes(referred_flag: true)
      end

      email = params[:user][:email]
      first_name = params[:user][:first_name]
      last_name = params[:user][:last_name]
      user_type = params[:user][:user_type]
      referred_flag = @user.referred_flag

      NewUserMailer.new_user_mailer(email, first_name, last_name, user_type, referred_flag).deliver_later

      if @user.active_for_authentication?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(@user)
      end
    else
      clean_up_passwords @user
      set_minimum_password_length
      flash[:errors] = resource.errors.full_messages
      redirect_to root_path
    end

  end


  def update
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_type, :first_name, :last_name, :college_id, :college_admin_flag)
  end


  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :user_type)
  end


  def check_if_email_already_exists
    User.all.each do |u|
      if u.email == sign_up_params[:email]
        redirect_to root_path, notice: "Email already registered."
      end
    end
  end


end