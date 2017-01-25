class AddMoreAcademicFieldsToAthProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :sat_2_total, :string
    add_column :athlete_profiles, :sat_2_math, :string
    add_column :athlete_profiles, :sat_2_reading, :string
    add_column :athlete_profiles, :sat_2_writing, :string
    add_column :athlete_profiles, :psat_total, :string
    add_column :athlete_profiles, :honor_classes, :text
    add_column :athlete_profiles, :preferred_major, :text
  end
end
