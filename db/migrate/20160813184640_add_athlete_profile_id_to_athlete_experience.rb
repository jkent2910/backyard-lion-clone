class AddAthleteProfileIdToAthleteExperience < ActiveRecord::Migration
  def change
    add_column :athlete_experiences, :athlete_profile_id, :integer
  end
end
