class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.belongs_to :college, index: true
      t.belongs_to :athlete_profile, index: true
      t.integer :interest_level

      t.timestamps null: false
    end
  end
end
