class AddAthleteExperienceIdToAthleteRecommendation < ActiveRecord::Migration
  def change
    add_column :athlete_recommendations, :athlete_experience_id, :integer
  end
end
