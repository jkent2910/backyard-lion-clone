class FactorRating < ActiveRecord::Base
  belongs_to :athlete_profile
  belongs_to :factor
  belongs_to :factor_choice
  belongs_to :factor_preference
end
