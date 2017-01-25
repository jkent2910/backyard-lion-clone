class AthleteRecommendation < ActiveRecord::Base
  belongs_to :athlete_profile
  belongs_to :athlete_experience

  validates :recommendation_text, :giver_relationship, presence: true
end
