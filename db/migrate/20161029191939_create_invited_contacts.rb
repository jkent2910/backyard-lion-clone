class CreateInvitedContacts < ActiveRecord::Migration
  def change
    create_table :invited_contacts do |t|
      t.string :email
      t.integer :invited_by_user_id

      t.timestamps null: false
    end
  end
end
