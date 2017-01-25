class StateRating < ActiveRecord::Base
  belongs_to :athlete_profile
  belongs_to :state
  belongs_to :state_preference
end
