class AddVideosCountToAthleteExperience < ActiveRecord::Migration
  def change
    add_column :athlete_experiences, :videos_count, :integer
  end
end
