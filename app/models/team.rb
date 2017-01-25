class Team < ActiveRecord::Base
  belongs_to :college

  has_many :followers
  has_many :athlete_profiles, :through => :followers

  has_many :interests
  has_many :athlete_profiles, :through => :interests

  has_many :team_ratings, -> { joins(:factor) }, dependent: :delete_all
  has_many :factors, through: :team_ratings
  accepts_nested_attributes_for :team_ratings

  has_many :team_notifications, dependent: :destroy

  validates :sport_name, :college_id, presence: true

  enum sport_gender: { female: 1, male: 2 }
end