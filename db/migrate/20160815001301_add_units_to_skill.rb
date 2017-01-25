class AddUnitsToSkill < ActiveRecord::Migration
  def change
    add_column :skills, :units, :text
  end
end
