class AddAthleteExperiencesCountToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :athlete_experiences_count, :integer, null: false, default: 0

    ids = Set.new
    AthleteExperience.all.each { |ae| ids << ae.athlete_profile_id }
    ids.each do |athlete_profile_id|
      AthleteProfile.reset_counters(athlete_profile_id, :athlete_experiences)
    end
  end
end
