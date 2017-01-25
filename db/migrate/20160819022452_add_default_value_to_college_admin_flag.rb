class AddDefaultValueToCollegeAdminFlag < ActiveRecord::Migration
  def change
    change_column :users, :college_admin_flag, :boolean, :default => false
  end
end
