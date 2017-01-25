class AddAthleteProfileIdToSkill < ActiveRecord::Migration
  def change
    add_column :skills, :athlete_profile_id, :integer
  end
end
