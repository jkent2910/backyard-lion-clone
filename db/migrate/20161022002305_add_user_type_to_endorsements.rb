class AddUserTypeToEndorsements < ActiveRecord::Migration
  def change
    add_column :endorsements, :user_type, :integer
  end
end
