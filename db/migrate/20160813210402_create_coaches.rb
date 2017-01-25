class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :sport
      t.string :position
      t.string :first_name
      t.string :last_name
      t.string :primary_phone
      t.string :primary_phone_type
      t.string :secondary_phone
      t.string :secondary_phone_type
      t.string :email

      t.timestamps null: false
    end
  end
end
