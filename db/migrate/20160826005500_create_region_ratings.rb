class CreateRegionRatings < ActiveRecord::Migration
  def change
    create_table :region_ratings do |t|
      t.integer :athlete_profile_id
      t.integer :region_id
      t.integer :region_preference_id

      t.timestamps null: false
    end
  end
end
