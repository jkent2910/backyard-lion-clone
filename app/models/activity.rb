class Activity < ActiveRecord::Base
  enum activity_type: { new_video: 1, new_athlete: 2, new_skill: 3, new_commitment: 4, byl_video: 5, athlete_media: 6}

  validates :activity_type, :associated_activity_id, presence: true

  has_attached_file :media, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :media, content_type: /\Aimage\/.*\z/

  has_many :activity_likes, dependent: :destroy

  validates :media_comment, length: { maximum: 101 }


  # new_video activity type saves the athlete_profile_id of the athlete who uploaded the video,
  # and the video ID as the associated_activity_id.

  # new_athlete activity type saves the athlete_profile_id of the new athlete and the
  # associated_activity_id is also set to the athlete_profile_id

  # new_skill activity type saves the athlete_profile_id of the athlete who added the skill,
  # and the skill ID as the associated_activity_id.

  # new_commitment activity type saves the athlete_profile_id of the athlete who added the commitment
  # and the associated_activity_id is also set to the athlete_profile_id

  # byl_video activity type does not save an athlete_profile_id and the associated_activity_id is set to the video ID

end