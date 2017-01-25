class AddViewedToAthleteNotification < ActiveRecord::Migration
  def change
    add_column :athlete_notifications, :viewed, :boolean, :default => false
  end
end
