class CreateAthleteNotifications < ActiveRecord::Migration
  def change
    create_table :athlete_notifications do |t|
      t.integer :athlete_profile_id
      t.string :notification_type
      t.integer :notification_id

      t.timestamps null: false
    end
  end
end
