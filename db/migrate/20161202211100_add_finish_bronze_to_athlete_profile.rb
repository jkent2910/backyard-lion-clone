class AddFinishBronzeToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :finish_bronze, :boolean, default: false
  end
end
