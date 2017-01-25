class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.belongs_to :team, index:true
      t.belongs_to :athlete_profile, index: true

      t.timestamps null: false
    end
  end
end
