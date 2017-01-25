class AddProfileViewCounterToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :profile_view_counter, :integer
  end
end
