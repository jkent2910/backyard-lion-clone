class MoreCollegeFields < ActiveRecord::Migration
  def change
    add_column :colleges, :num_years, :integer
    add_column :colleges, :address, :string
    add_column :colleges, :median_earnings, :integer
  end
end
