class AddSchoolCommitToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :school_commit, :string
  end
end
