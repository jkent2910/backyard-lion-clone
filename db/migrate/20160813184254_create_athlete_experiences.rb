class CreateAthleteExperiences < ActiveRecord::Migration
  def change
    create_table :athlete_experiences do |t|
      t.string :position
      t.string :team_name
      t.string :sport
      t.integer :year_start
      t.integer :year_end
      t.boolean :present
      t.string :city
      t.string :state
      t.text :description
      t.timestamps null: false
    end
  end
end
