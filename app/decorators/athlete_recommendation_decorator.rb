class AthleteRecommendationDecorator < Draper::Decorator
  delegate_all

  def full_name
    object.giver_first_name + " " + object.giver_last_name
  end

  def reco_image
    if object.giver_athlete_profile_id.nil?
      "missing.png"
    else
      profile = AthleteProfile.find(object.giver_athlete_profile_id)
      profile.profile_picture
    end
  end
end
