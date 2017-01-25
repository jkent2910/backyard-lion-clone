class TeamNotification < ActiveRecord::Base
  belongs_to :team

  enum notification_type: { athlete_profile_view: 1, athlete_interest: 2 }

  validates :team_id, :notification_type, presence: true
end
