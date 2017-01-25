class AddAthleteExperienceIdToStatistic < ActiveRecord::Migration
  def change
    add_column :statistics, :athlete_experience_id, :integer
  end
end
