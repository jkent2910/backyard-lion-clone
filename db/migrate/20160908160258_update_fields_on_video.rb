class UpdateFieldsOnVideo < ActiveRecord::Migration
  def change
    remove_column :videos, :athlete_profile_id
    add_column :videos, :athlete_experience_id, :integer
  end
end
