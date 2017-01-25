class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :interests, :college_id, :team_id
  end
end
