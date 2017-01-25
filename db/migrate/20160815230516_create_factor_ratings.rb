class CreateFactorRatings < ActiveRecord::Migration
  def change
    create_table :factor_ratings do |t|
      t.integer :athlete_profile_id
      t.integer :factor_id
      t.integer :factor_choice_id

      t.timestamps null: false
    end

    add_index :factor_ratings, :factor_id
    add_index :factor_ratings, :athlete_profile_id
  end
end
