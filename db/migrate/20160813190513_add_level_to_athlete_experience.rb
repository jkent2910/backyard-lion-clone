class AddLevelToAthleteExperience < ActiveRecord::Migration
  def change
    add_column :athlete_experiences, :level, :string
  end
end
