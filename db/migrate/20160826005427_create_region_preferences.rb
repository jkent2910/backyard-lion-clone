class CreateRegionPreferences < ActiveRecord::Migration
  def change
    create_table :region_preferences do |t|
      t.integer :region_id
      t.string :name
      t.integer :value

      t.timestamps null: false
    end
  end
end
