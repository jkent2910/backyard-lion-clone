class AddFactorPreferenceIdToFactorRating < ActiveRecord::Migration
  def change
    add_column :factor_ratings, :factor_preference_id, :integer
  end
end
