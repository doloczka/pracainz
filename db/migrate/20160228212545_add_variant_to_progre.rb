class AddVariantToProgre < ActiveRecord::Migration
  def change
    add_column :progres, :variant, :integer
  end
end
