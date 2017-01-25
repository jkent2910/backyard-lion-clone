class CreateNewAthleteInvites < ActiveRecord::Migration
  def change
    create_table :new_athlete_invites do |t|
      t.string :first_name
      t.string :email
      t.string :grad_year
      t.string :state
      t.string :sport
      t.string :high_school
      t.string :invite_count

      t.timestamps null: false
    end
  end
end
