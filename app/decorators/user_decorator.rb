class UserDecorator < Draper::Decorator
  delegate_all

  def determine_admin_status
    if object.college_admin_flag?
      "Yes"
    else
      "No"
    end
  end

  def sign_up_method
    if !Identity.find_by(user_id: object.id).nil?
      Identity.find_by(user_id: object.id).provider
    else
      "Email"
    end
  end

  def days_since_last_signin
    unless object.last_sign_in_at.nil?
      ((Time.now - object.last_sign_in_at) / 1.day).round(2)
    end
  end
end
