class ChangeProfileViewColumn < ActiveRecord::Migration
  def change
    rename_column :athlete_profile_views, :college_id, :team_id
  end
end
