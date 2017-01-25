class StatePreference < ActiveRecord::Base
  belongs_to :state

  validates :state, presence: true
  validates :name, presence: true
  validates :value, presence: true
end
