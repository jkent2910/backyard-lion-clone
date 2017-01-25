class AddCollegeValidatedToUser < ActiveRecord::Migration
  def change
    add_column :users, :college_validated, :boolean, default: true
  end
end
