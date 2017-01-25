class AddReferredFlagToUser < ActiveRecord::Migration
  def change
    add_column :users, :referred_flag, :boolean, default: false
  end
end
