class UpdateDefaultValueForContactInfoPrivacy < ActiveRecord::Migration
  def change
    change_column :athlete_profiles, :contact_info_privacy, :integer, default: 2
  end
end
