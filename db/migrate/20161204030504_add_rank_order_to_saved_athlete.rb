class AddRankOrderToSavedAthlete < ActiveRecord::Migration
  def change
    add_column :saved_athletes, :rank_order, :integer
  end
end
