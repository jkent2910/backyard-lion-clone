class AddToCollegeModel < ActiveRecord::Migration
  def change
    add_column :colleges, :acceptance_rate, :integer
    add_column :colleges, :sat_range, :string
    add_column :colleges, :act_range, :string
    add_column :colleges, :application_fee, :string
    add_column :colleges, :application_website, :string
    add_column :colleges, :net_price, :decimal
    add_column :colleges, :overall_grade, :string
    add_column :colleges, :academics_grade, :string
    add_column :colleges, :diversity_grade, :string
    add_column :colleges, :athletics_grade, :string
    add_column :colleges, :professors_grade, :string
    add_column :colleges, :dorms_grade, :string
    add_column :colleges, :student_life_grade, :string
    add_column :colleges, :value_grade, :string
    add_column :colleges, :campus_grade, :string
    add_column :colleges, :party_scene_grade, :string
    add_column :colleges, :location_grade, :string
    add_column :colleges, :safety_grade, :string
    add_column :colleges, :student_faculty_ratio, :string
    add_column :colleges, :financial_aid_percentage, :decimal
    add_column :colleges, :avg_total_aid_awarded, :decimal
    add_column :colleges, :graduation_rate, :decimal
  end
end
