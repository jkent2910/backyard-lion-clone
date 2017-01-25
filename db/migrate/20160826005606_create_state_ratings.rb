class CreateStateRatings < ActiveRecord::Migration
  def change
    create_table :state_ratings do |t|
      t.integer :athlete_profile_id
      t.integer :state_id
      t.integer :state_preference_id

      t.timestamps null: false
    end
  end
end
