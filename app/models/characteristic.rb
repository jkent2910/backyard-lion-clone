class Characteristic < ActiveRecord::Base
  validates_presence_of :name
  has_many :characteristic_answers
end
