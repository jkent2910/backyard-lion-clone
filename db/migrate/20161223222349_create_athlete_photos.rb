class CreateAthletePhotos < ActiveRecord::Migration
  def change
    create_table :athlete_photos do |t|
      t.integer :athlete_profile_id
      t.attachment :image

      t.timestamps null: false
    end
  end
end
