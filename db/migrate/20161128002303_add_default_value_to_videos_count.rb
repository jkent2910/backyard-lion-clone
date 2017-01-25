class AddDefaultValueToVideosCount < ActiveRecord::Migration
  def change
    change_column :athlete_experiences, :videos_count, :integer, :default => 0, null: false
  end
end
