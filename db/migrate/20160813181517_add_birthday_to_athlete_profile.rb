class AddBirthdayToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :birthday, :date
  end
end
