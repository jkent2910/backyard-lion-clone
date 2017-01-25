class AddOtherAthleteProfileIdToAthleteProfileViews < ActiveRecord::Migration
  def change
    add_column :athlete_profile_views, :other_athlete_profile_id, :integer
  end
end
