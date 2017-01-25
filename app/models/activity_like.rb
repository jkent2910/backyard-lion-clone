class ActivityLike < ActiveRecord::Base
  belongs_to :activity

  validates_presence_of :activity_id, :liker_id
end
