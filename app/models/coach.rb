class Coach < ActiveRecord::Base
  belongs_to :athlete_profile

  validates :first_name, :last_name, :sport, presence: true
end
