class ChangeColumnOnSavedAthlete < ActiveRecord::Migration
  def change
    remove_column :saved_athletes, :team_id
    add_column :saved_athletes, :user_id, :integer
  end
end
