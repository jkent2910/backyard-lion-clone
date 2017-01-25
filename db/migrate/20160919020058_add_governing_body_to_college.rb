class AddGoverningBodyToCollege < ActiveRecord::Migration
  def change
    add_column :colleges, :governing_body, :string
  end
end
