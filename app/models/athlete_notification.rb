class AthleteNotification < ActiveRecord::Base
  belongs_to :athlete_profile, :counter_cache => true

  validates_presence_of :athlete_profile_id, :notification_type, :notification_id


  # Notification types:
  # skill_endorsement -- saves athlete_profile_id of the athlete who has the skill, and the notification_id is set to the
  #                      corresponding endorsement_id
  # recommendation -- saves the athlete_profile_id of the athlete who received the reco, and the notification_id is set to the
  #                   corresponding athlete_recommendation_id
  # profile_view -- saves the athlete_profile_id of the athlete whose profile was viewed, and the notification_id is set to the current_user_id
  # team_profile_view -- saves the athlete_profile_id of the athlete whose profile was viewed, and the notification_id is set to the team_id
  # rating -- saves the athlete_profile_id of the athlete whose experience was rated, and the notification_id is set to athlete_rating_id
  # same high school -- saves the athlete_profile_id of the athlete who goes to the same high school, and the notification_id is set to the
  #                     new athlete_profile_id of the new athlete.
  # info_request -- saves the athlete_profile_id of the athlete whose info is requested, notification_id is set to the athlete_request
  # video_comment -- saves the athlete_profile_id of the athlete whose video has the comment, notification_id is set to the video comment
  # activity_like -- saves the athlete_profile_id of the athlete's activity who received the like, notification_id is set to the activity_like

end