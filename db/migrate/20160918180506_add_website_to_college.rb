class AddWebsiteToCollege < ActiveRecord::Migration
  def change
    add_column :colleges, :website, :string
  end
end
