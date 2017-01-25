class AthleteExperience < ActiveRecord::Base
  belongs_to :athlete_profile, :counter_cache => true
  has_many :athlete_recommendations
  has_many :videos, dependent: :destroy
  accepts_nested_attributes_for :videos, reject_if: :all_blank, allow_destroy: true

  has_many :statistics
  accepts_nested_attributes_for :statistics, reject_if: :all_blank, allow_destroy: true

  has_many :athlete_ratings

  validates :sport, :level, presence: true

end