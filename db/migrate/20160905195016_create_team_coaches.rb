class CreateTeamCoaches < ActiveRecord::Migration
  def change
    create_table :team_coaches do |t|
      t.belongs_to :team, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
