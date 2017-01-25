class AddCollegeAdminFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :college_admin_flag, :boolean
  end
end
