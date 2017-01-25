class CreateFactorChoices < ActiveRecord::Migration
  def change
    create_table :factor_choices do |t|
      t.integer :factor_id
      t.string :name
      t.integer :value

      t.timestamps null: false
    end
  end
end