class AddSportCommitToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :sport_commit, :string
  end
end
