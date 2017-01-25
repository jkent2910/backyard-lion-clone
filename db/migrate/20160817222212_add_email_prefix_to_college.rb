class AddEmailPrefixToCollege < ActiveRecord::Migration
  def change
    add_column :colleges, :email_prefix, :string
  end
end
