class TeamRating < ActiveRecord::Base
  belongs_to :team
  belongs_to :factor
  belongs_to :factor_preference

  validates :factor_preference_id, presence: true
end
