class Video < ActiveRecord::Base
  belongs_to :athlete_experience, :counter_cache => true
  after_create :create_activity_record

  validates :name, :url, presence: true
  before_destroy :delete_activity

  has_many :comments
  has_many :users, :through => :comments

  def create_activity_record
    if !self.athlete_experience_id.nil?
      athlete_profile = AthleteExperience.find(self.athlete_experience_id).athlete_profile_id
      Activity.create(activity_type: "new_video", athlete_profile_id: athlete_profile, associated_activity_id: self.id )
    else
      Activity.create(activity_type: "byl_video", associated_activity_id: self.id)
    end

  end

  def delete_activity
    activity = Activity.where(associated_activity_id: self.id)
    activity.destroy_all
  end

end
