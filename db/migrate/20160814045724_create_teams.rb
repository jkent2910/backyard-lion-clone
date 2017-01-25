class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :sport_name
      t.string :sport_division
      t.string :sport_conference
      t.string :playing_style
      t.string :playing_time
      t.string :coach_prestige
      t.string :conference_prestige
      t.string :pro_potential
      t.string :program_tradition
      t.string :television_exposure
      t.string :athletic_facilities
      t.string :championship_contender
      t.string :stadium_atmosphere
      t.string :academic_prestige
      t.string :campus_lifestyle
      t.string :coach_stability

      t.timestamps null: false
    end
  end
end
