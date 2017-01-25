class AddMoreContactFieldsToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :guardian_relationship, :string
    add_column :athlete_profiles, :guardian_first_name, :string
    add_column :athlete_profiles, :guardian_last_name, :string
    add_column :athlete_profiles, :guardian_primary_phone, :string
    add_column :athlete_profiles, :guardian_primary_phone_type, :string
    add_column :athlete_profiles, :guardian_secondary_phone, :string
    add_column :athlete_profiles, :guardian_secondary_phone_type, :string
    add_column :athlete_profiles, :guardian_primary_email, :string
    add_column :athlete_profiles, :guardian_edu_level, :string
    add_column :athlete_profiles, :guardian_two_relationship, :string
    add_column :athlete_profiles, :guardian_two_first_name, :string
    add_column :athlete_profiles, :guardian_two_last_name, :string
    add_column :athlete_profiles, :guardian_two_primary_phone, :string
    add_column :athlete_profiles, :guardian_two_primary_phone_type, :string
    add_column :athlete_profiles, :guardian_two_secondary_phone, :string
    add_column :athlete_profiles, :guardian_two_secondary_phone_type, :string
    add_column :athlete_profiles, :guardian_two_primary_email, :string
    add_column :athlete_profiles, :guardian_two_edu_level, :string
    add_column :athlete_profiles, :mailing_address, :string
    add_column :athlete_profiles, :mailing_city, :string
    add_column :athlete_profiles, :mailing_state, :string
    add_column :athlete_profiles, :mailing_zipcode, :string
  end
end
