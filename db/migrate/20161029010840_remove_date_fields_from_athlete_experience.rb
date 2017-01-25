class RemoveDateFieldsFromAthleteExperience < ActiveRecord::Migration
  def change
    remove_column :athlete_experiences, :year_start
    remove_column :athlete_experiences, :year_end
    remove_column :athlete_experiences, :present
  end
end