class InterestDecorator < Draper::Decorator
  delegate_all

  def calculate_percentage

    athlete = AthleteProfile.find(object.athlete_profile_id)
    total_interests = athlete.interests.count
    team_row_order = object.row_order

    if team_row_order.nil?
      "N/A"
    else

      row_order = (team_row_order.to_f / total_interests.to_f).to_f

      if row_order < 0.10
        "Top 10%"
      elsif row_order > 0.10 && row_order < 0.20
        "Top 20%"
      elsif row_order > 0.20 && row_order < 0.30
        "Top 30%"
      elsif row_order > 0.30 && row_order < 0.40
        "Top 40%"
      elsif row_order > 0.40 && row_order < 0.50
        "Top 50%"
      elsif row_order > 0.50 && row_order < 0.60
        "Top 60%"
      elsif row_order > 0.60 && row_order < 0.70
        "Top 70%"
      elsif row_order > 0.70 && row_order < 1.00
        "Top 80%"
      end
    end

  end
end