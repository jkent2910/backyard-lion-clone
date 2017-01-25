class AddContactsInvitedToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :contacts_invited, :integer
  end
end
