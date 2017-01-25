class AthleteRequest < ActiveRecord::Base
  belongs_to :athlete_profile

  validates :athlete_profile_id, :athlete_profile_field, :user_id, presence: true

  serialize :athlete_profile_field, Array
end
