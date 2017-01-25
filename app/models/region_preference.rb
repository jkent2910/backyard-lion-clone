class RegionPreference < ActiveRecord::Base
  belongs_to :region

  validates :region, presence: true
  validates :name, presence: true
  validates :value, presence: true
end
