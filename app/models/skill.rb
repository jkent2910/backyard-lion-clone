class Skill < ActiveRecord::Base
  belongs_to :athlete_profile

  validates :name, :units, :skill_result, presence: true

  after_create :create_activity_record
  before_destroy :delete_activity

  def create_activity_record
    Activity.create(activity_type: "new_skill", athlete_profile_id: self.athlete_profile_id, associated_activity_id: self.id )
  end

  def delete_activity
    activity = Activity.where(associated_activity_id: self.id)
    activity.destroy_all
  end
end