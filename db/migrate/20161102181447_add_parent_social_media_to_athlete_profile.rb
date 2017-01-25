class AddParentSocialMediaToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :guardian_twitter, :string
    add_column :athlete_profiles, :guardian_facebook, :string
    add_column :athlete_profiles, :second_guardian_twitter, :string
    add_column :athlete_profiles, :second_guardian_facebook, :string
  end
end
