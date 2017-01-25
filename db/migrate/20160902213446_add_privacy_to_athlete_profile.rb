class AddPrivacyToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :contact_info_privacy, :integer
    add_column :athlete_profiles, :academic_info_privacy, :string
  end
end
