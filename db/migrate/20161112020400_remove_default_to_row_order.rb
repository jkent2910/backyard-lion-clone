class RemoveDefaultToRowOrder < ActiveRecord::Migration
  def change
    change_column :interests, :row_order, :integer, default: nil

  end
end
