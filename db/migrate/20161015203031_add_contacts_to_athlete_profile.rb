class AddContactsToAthleteProfile < ActiveRecord::Migration
  def change
    add_column :athlete_profiles, :contacts, :text
  end
end
