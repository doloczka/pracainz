class AddRateToProgre < ActiveRecord::Migration
  def change
    add_column :progres, :rate, :decimal
  end
end
