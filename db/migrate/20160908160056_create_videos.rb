class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :url
      t.text :description
      t.integer :athlete_profile_id

      t.timestamps null: false
    end
  end
end
