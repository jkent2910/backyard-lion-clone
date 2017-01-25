class AddContactFieldsToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :preferred_method_contact, :string
    add_column :athlete_profiles, :primary_phone, :string
    add_column :athlete_profiles, :primary_phone_type, :string
    add_column :athlete_profiles, :secondary_phone, :string
    add_column :athlete_profiles, :secondary_phone_type, :string
    add_column :athlete_profiles, :primary_email, :string
    add_column :athlete_profiles, :secondary_email, :string
    add_column :athlete_profiles, :facebook_url, :string
    add_column :athlete_profiles, :twitter_url, :string
    add_column :athlete_profiles, :instagram_url, :string
  end
end
