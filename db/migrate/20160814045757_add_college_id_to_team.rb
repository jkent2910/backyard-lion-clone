class AddCollegeIdToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :college_id, :integer
  end
end
