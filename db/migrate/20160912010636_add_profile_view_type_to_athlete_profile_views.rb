class AddProfileViewTypeToAthleteProfileViews < ActiveRecord::Migration
  def change
    add_column :athlete_profile_views, :profile_view_type, :integer
  end
end
