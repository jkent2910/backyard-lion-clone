class AddAttachmentMediaToActivities < ActiveRecord::Migration
  def self.up
    change_table :activities do |t|
      t.attachment :media
    end
  end

  def self.down
    remove_attachment :activities, :media
  end
end
