class AddOtherNameToAthleteAward < ActiveRecord::Migration
  def change
    add_column :athlete_awards, :other_name, :string
  end
end
