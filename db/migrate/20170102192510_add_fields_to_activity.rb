class AddFieldsToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :media_comment, :string
  end
end