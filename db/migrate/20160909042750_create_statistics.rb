class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.string :stat
      t.decimal :result
      t.string :result_unit
      t.string :year

      t.timestamps null: false
    end
  end
end
