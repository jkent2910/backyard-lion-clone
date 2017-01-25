class CreateActivityLikes < ActiveRecord::Migration
  def change
    create_table :activity_likes do |t|
      t.integer :activity_id
      t.integer :liker_id

      t.timestamps null: false
    end
  end
end
