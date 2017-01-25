class ChangeDataTypeForCollege < ActiveRecord::Migration
  def change
    change_column :colleges, :enrollment, :string
    change_column :colleges, :acceptance_rate, :string
    change_column :colleges, :net_price, :string
    change_column :colleges, :financial_aid_percentage, :string
    change_column :colleges, :avg_total_aid_awarded, :string
    change_column :colleges, :graduation_rate, :string
    change_column :colleges, :num_years, :string
    change_column :colleges, :median_earnings, :string
  end
end
