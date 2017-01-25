class RemoveRatingIdFromAthleteRating < ActiveRecord::Migration
  def change
    remove_column :athlete_ratings, :rating_id, :integer
  end
end
