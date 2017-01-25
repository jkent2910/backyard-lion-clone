class AddInviteSentCountToInvitedContact < ActiveRecord::Migration
  def change
    add_column :invited_contacts, :invite_sent_count, :integer
  end
end
