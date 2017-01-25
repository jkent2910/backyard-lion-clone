class CreateAthleteProfileViews < ActiveRecord::Migration
  def change
    create_table :athlete_profile_views do |t|
      t.belongs_to :college, index: true
      t.belongs_to :athlete_profile, index: true

      t.timestamps null: false
    end
  end
end
