class AddAthleteProfileIdToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :athlete_profile_id, :integer
  end
end
