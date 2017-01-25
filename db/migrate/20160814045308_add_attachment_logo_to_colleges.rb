class AddAttachmentLogoToColleges < ActiveRecord::Migration
  def self.up
    change_table :colleges do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :colleges, :logo
  end
end
