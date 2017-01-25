class CreateCharacteristicAnswers < ActiveRecord::Migration
  def change
    create_table :characteristic_answers do |t|
      t.integer :athlete_profile_id
      t.integer :characteristic_id
      t.text :athlete_answer

      t.timestamps null: false
    end
  end
end
