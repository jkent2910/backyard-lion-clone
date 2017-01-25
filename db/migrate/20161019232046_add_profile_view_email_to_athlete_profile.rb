class AddProfileViewEmailToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :profile_view_email, :boolean, default: true
  end
end
