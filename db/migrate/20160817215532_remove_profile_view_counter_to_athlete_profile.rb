class RemoveProfileViewCounterToAthleteProfile < ActiveRecord::Migration
  def change
    remove_column :athlete_profiles, :profile_view_counter, :integer
  end
end
