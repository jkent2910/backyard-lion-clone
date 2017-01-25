class AddCoachFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :coach_sport, :string
    add_column :users, :coach_position, :string
  end
end
