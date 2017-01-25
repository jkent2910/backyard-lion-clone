class AddSecondaryPositionToAthleteExperience < ActiveRecord::Migration
  def change
    add_column :athlete_experiences, :secondary_position, :string
  end
end
