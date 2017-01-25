class CreateCoachContacts < ActiveRecord::Migration
  def change
    create_table :coach_contacts do |t|
      t.integer :college_id
      t.string :college_name
      t.integer :team_id
      t.string :sport
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
