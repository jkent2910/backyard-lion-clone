class AddAthleteNotificationsCountToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :athlete_notifications_count, :integer, null: false, default: 0

    ids = Set.new
    AthleteNotification.all.each { |ae| ids << ae.athlete_profile_id }
    ids.each do |athlete_profile_id|
      AthleteProfile.reset_counters(athlete_profile_id, :athlete_notifications)
    end
  end
end
