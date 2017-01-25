class AddConferenceAndDivisionToCollege < ActiveRecord::Migration
  def change
    add_column :colleges, :college_division, :string
    add_column :colleges, :college_conference, :string
  end
end
