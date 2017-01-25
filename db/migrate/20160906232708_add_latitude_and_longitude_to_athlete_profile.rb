class AddLatitudeAndLongitudeToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :latitude, :float
    add_column :athlete_profiles, :longitude, :float
  end
end
