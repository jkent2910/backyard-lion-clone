class AddAcademicFieldsToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :school_name, :string
    add_column :athlete_profiles, :graduation_year, :string
    add_column :athlete_profiles, :activities_societies, :text
    add_column :athlete_profiles, :cum_gpa_score, :string
    add_column :athlete_profiles, :cum_gpa_out_of, :string
    add_column :athlete_profiles, :cum_gpa_scale, :string
    add_column :athlete_profiles, :core_gpa_score, :string
    add_column :athlete_profiles, :core_gpa_out_of, :string
    add_column :athlete_profiles, :weighted_gpa_score, :string
    add_column :athlete_profiles, :weighted_gpa_out_of, :string
    add_column :athlete_profiles, :class_rank, :string
    add_column :athlete_profiles, :class_rank_out_of, :string
    add_column :athlete_profiles, :weighted_class_rank, :string
    add_column :athlete_profiles, :weighted_class_rank_out_of, :string
    add_column :athlete_profiles, :sat_total, :string
    add_column :athlete_profiles, :sat_math, :string
    add_column :athlete_profiles, :sat_reading, :string
    add_column :athlete_profiles, :sat_writing, :string
    add_column :athlete_profiles, :act_total, :string
  end
end
