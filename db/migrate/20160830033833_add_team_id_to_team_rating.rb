class AddTeamIdToTeamRating < ActiveRecord::Migration
  def change
    add_column :team_ratings, :team_id, :integer
  end
end
