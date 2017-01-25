class CollegeMajor < ActiveRecord::Base
  belongs_to :college
  validates :name, presence: true
end
