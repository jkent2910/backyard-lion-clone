class CreateAthleteRequests < ActiveRecord::Migration
  def change
    create_table :athlete_requests do |t|
      t.integer :athlete_profile_id
      t.string :athlete_profile_field
      t.integer :team_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
