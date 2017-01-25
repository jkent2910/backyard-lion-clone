class AddAthleteProfileIdToAthleteAward < ActiveRecord::Migration
  def change
    add_column :athlete_awards, :athlete_profile_id, :integer
  end
end
