class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :video
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
