class AddVideoInfoToAthleteExperience < ActiveRecord::Migration
  def change
    add_column :athlete_experiences, :video_title, :string
    add_column :athlete_experiences, :video_url, :string
  end
end
