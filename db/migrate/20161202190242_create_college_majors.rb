class CreateCollegeMajors < ActiveRecord::Migration
  def change
    create_table :college_majors do |t|
      t.string :name
      t.boolean :most_popular
      t.integer :college_id

      t.timestamps null: false
    end
  end
end
