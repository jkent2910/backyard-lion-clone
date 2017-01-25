class AddSportGenderToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :sport_gender, :integer
  end
end
