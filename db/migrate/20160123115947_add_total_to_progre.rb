class AddTotalToProgre < ActiveRecord::Migration
  def change
    add_column :progres, :total, :integer
  end
end
