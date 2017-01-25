class TestFlagToAthleteNotification < ActiveRecord::Migration
  def change
    add_column :athlete_notifications, :test_flag, :boolean, default: false, null: false
  end
end
