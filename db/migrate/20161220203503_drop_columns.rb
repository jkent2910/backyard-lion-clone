class DropColumns < ActiveRecord::Migration
  def change
    remove_column :users, :college_id
    remove_column :users, :college_validated
  end
end
