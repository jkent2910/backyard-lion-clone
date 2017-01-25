class CreateAthleteProfiles < ActiveRecord::Migration
  def change
    create_table :athlete_profiles do |t|

      t.integer :gender
      t.string :country
      t.string :city
      t.string :state
      t.string :zipcode
      t.decimal :height_feet
      t.decimal :height_inches
      t.decimal :weight
      t.timestamps null: false
    end
  end
end
