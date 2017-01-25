class CreateAthleteAwards < ActiveRecord::Migration
  def change
    create_table :athlete_awards do |t|
      t.string :name
      t.string :issuer
      t.string :year
      t.text :description

      t.timestamps null: false
    end
  end
end
