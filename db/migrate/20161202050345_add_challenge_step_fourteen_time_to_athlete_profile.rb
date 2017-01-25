class AddChallengeStepFourteenTimeToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :challenge_step_fourteen_time, :datetime
  end
end
