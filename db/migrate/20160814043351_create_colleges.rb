class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :nickname
      t.string :state
      t.string :city
      t.integer :enrollment
      t.string :campus_setting
      t.string :school_type
      t.string :tuition_in_state
      t.string :tuition_out_of_state

      t.timestamps null: false
    end
  end
end
