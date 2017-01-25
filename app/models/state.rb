class State < ActiveRecord::Base
  belongs_to :region
  has_many :state_preferences
  validates_presence_of :name
end
