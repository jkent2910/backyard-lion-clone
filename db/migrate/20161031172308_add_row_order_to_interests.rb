class AddRowOrderToInterests < ActiveRecord::Migration
  def change
    add_column :interests, :row_order, :integer
  end
end
