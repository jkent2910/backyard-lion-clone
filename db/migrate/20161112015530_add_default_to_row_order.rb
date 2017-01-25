class AddDefaultToRowOrder < ActiveRecord::Migration
  def change
    change_column :interests, :row_order, :integer, default: 1
  end
end
