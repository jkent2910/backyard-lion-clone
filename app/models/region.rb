class Region < ActiveRecord::Base
  validates_presence_of :name
  has_many :region_preferences
  has_many :states
end
