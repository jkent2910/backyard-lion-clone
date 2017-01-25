class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :activity_type
      t.integer :athlete_profile_id
      t.integer :associated_activity_id

      t.timestamps null: false
    end
  end
end
