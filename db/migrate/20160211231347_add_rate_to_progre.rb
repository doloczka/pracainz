class AddRateToProgre < ActiveRecord::Migration
  def change
    add_column :progres, :rate, :double
  end
end
