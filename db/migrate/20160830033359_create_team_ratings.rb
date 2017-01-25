class CreateTeamRatings < ActiveRecord::Migration
  def change
    create_table :team_ratings do |t|
      t.integer :college_id
      t.integer :factor_id
      t.integer :factor_preference_id

      t.timestamps null: false
    end
  end
end
