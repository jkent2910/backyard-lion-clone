class CreateEndorsementInvites < ActiveRecord::Migration
  def change
    create_table :endorsement_invites do |t|
      t.string :email
      t.integer :invited_by_user_id
      t.integer :invite_sent_count

      t.timestamps null: false
    end
  end
end
