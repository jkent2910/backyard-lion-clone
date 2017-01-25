class RemoveVideoFromAthleteExperience < ActiveRecord::Migration
  def change
    remove_column :athlete_experiences, :video_title
    remove_column :athlete_experiences, :video_url
  end
end
