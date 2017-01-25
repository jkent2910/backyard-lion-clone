class Factor < ActiveRecord::Base
  validates_presence_of :name
  has_many :factor_choices
  has_many :factor_preferences
end