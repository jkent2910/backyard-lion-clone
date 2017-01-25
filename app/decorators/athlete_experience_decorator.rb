class AthleteExperienceDecorator < Draper::Decorator
  delegate_all

  def location
    if !object.city.blank? && !object.state.blank?
      object.city + "," + object.state
    elsif object.city.blank? && !object.state.blank?
      object.state
    elsif object.state.blank? && !object.city.blank?
      object.city
    elsif object.state.blank? && object.city.blank?
      ""
    end
  end

  def start_and_end
    if !object.year_start.blank?
      if object.present?
        object.year_start.to_s + "-" + "Present"
      elsif !object.year_end.blank?
        object.year_start.to_s + "-" + object.year_end.to_s
      elsif object.year_end.blank?
        object.year_start.to_s + "-" + "?"
      end
    elsif object.year_start.blank?
      "No dates listed for this experience"
    end
  end

  def ratings_count
    object.athlete_ratings.count
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
        "B+"
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


end