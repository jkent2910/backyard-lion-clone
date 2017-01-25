class AthleteProfileDecorator < Draper::Decorator
  delegate_all

  def full_name
    User.find(object.user_id).first_name + " " + User.find(object.user_id).last_name
  end

  def calculate_age
    dob = object.birthday
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def date_since_creation
    user = User.find(object.user_id)

    ((Time.now - user.created_at) / 24.hours).round(0)
  end

  def first_name
    User.find(object.user_id).first_name
  end

  def rank_count
    if object.interests.where.not(row_order: nil).count >= 10
      true
    else
      false
    end
  end

  def determine_contact_info_privacy(current_user)
    if !current_user.nil?
      if object.contact_info_privacy == "contact_info_college"
        if current_user.coach? || current_user.college_admin?
          true
        elsif object.user_id == current_user.id
          true
        else
          false
        end
      elsif object.user_id == current_user.id
        true
      else
        true
      end
    end
  end

  def determine_academic_info_privacy(current_user)
    if !current_user.nil?
      if object.academic_info_privacy == "academic_info_college"
        if current_user.coach? || current_user.college_admin?
          true
        elsif object.user_id == current_user.id
          true
        else
          false
        end
      elsif object.user_id == current_user.id
        true
      else
        true
      end
    end
  end

  def academic_info_privacy_string
    if object.academic_info_privacy == "academic_info_college"
      "Coaches and recruiters are able to see this information"
    elsif object.academic_info_privacy == "academic_info_private"
      "Only you are able to see this information"
    else
      "Public"
    end
  end

  def contact_info_privacy_string
    if object.contact_info_privacy == "contact_info_college"
      "Coaches and recruiters are able to see this information"
    elsif object.contact_info_privacy == "contact_info_private"
      "Only you are able to see this information"
    else
      "Public"
    end
  end

  def average_rating
    if object.athlete_ratings.empty?
      "N/A"
    else
      average_rating = object.athlete_ratings.average(:rating).to_f
      if average_rating >= 0.to_f && average_rating <= 0.99
        "C-"
      elsif average_rating >= 1.to_f && average_rating <= 1.49
        "C"
      elsif average_rating >= 1.50 && average_rating <= 1.99
        "C+"
      elsif average_rating >= 2.to_f && average_rating <= 2.49
        "B-"
      elsif average_rating >= 2.50 && average_rating <= 2.99
        "B"
      elsif average_rating >= 3.to_f && average_rating <= 3.49
        "B+"
      elsif average_rating >= 3.50 && average_rating <= 3.99
        "A-"
      elsif average_rating >= 4.to_f && average_rating <= 4.50
        "A"
      elsif average_rating >= 4.51 && average_rating <= 4.99
        "A+"
      elsif average_rating >= 5.0
        "A+"
      end
    end
  end

  def trust_rating
    athlete_notification = object.athlete_notifications

    endorsement_count =  athlete_notification.where(notification_type: "skill_endorsement").count
    endorsement_trust_rating = endorsement_count * 5

    rating_count =  athlete_notification.where(notification_type: "rating").count
    rating_trust_rating = rating_count * 5

    recommendation_count =  athlete_notification.where(notification_type: "recommendation").count
    recommendation_trust_rating = recommendation_count * 10

    total_rating = recommendation_trust_rating + rating_trust_rating + endorsement_trust_rating
    if total_rating >= 0 && total_rating <= 4.9
      "<p style='color:orangered;'>F</p>".html_safe
    elsif total_rating >= 5 && total_rating <= 9.99
      "<p style='color:darkred;'>D+</p>".html_safe
    elsif total_rating >= 10 && total_rating <= 14.99
      "<p style='color:darkred;'>C-</p>".html_safe
    elsif total_rating >= 15 && total_rating <= 19.99
      "<p style='color:mediumvioletred;'>C</p>".html_safe
    elsif total_rating >= 20 && total_rating <= 24.99
      "<p style='color:mediumvioletred;'>C+</p>".html_safe
    elsif total_rating >= 25 && total_rating <= 29.99
      "<p style='color:lightskyblue;'>B-</p>".html_safe
    elsif total_rating >= 30 && total_rating <= 34.99
      "<p style='color:lightskyblue;'>B</p>".html_safe
    elsif total_rating >= 35 && total_rating <= 39.99
      "<p style='color:lightskyblue;'>B+</p>".html_safe
    elsif total_rating >= 40 && total_rating <= 44.99
      "A-"
    elsif total_rating >= 45 && total_rating <= 49.99
      "A"
    elsif total_rating >= 50
      "A+"
    end


  end

  def create_bitly
    long_url = "https://www.backyardlion.com/athlete_profiles/#{object.id}"
    Bitly.client.shorten(long_url).short_url
  end

end