class AddLastInviteSentToNewAthleteInvite < ActiveRecord::Migration
  def change
    add_column :new_athlete_invites, :last_invite_sent, :date
  end
end
