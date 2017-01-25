class CreateStatePreferences < ActiveRecord::Migration
  def change
    create_table :state_preferences do |t|
      t.integer :state_id
      t.string :name
      t.integer :value

      t.timestamps null: false
    end
  end
end
