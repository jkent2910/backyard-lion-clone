class RegionRating < ActiveRecord::Base
  belongs_to :athlete_profile
  belongs_to :region
  belongs_to :region_preference
end
