class DropTeamCoachesTable < ActiveRecord::Migration
  def change
    drop_table :team_coaches
  end
end
