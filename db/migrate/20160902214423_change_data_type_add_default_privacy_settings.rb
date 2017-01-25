class ChangeDataTypeAddDefaultPrivacySettings < ActiveRecord::Migration
  def change
    change_column :athlete_profiles, :academic_info_privacy, 'integer USING CAST(academic_info_privacy AS integer)'
    change_column_default :athlete_profiles, :academic_info_privacy, 1
    change_column_default :athlete_profiles, :contact_info_privacy, 1
  end
end
