class AddVariantToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :variant, :integer
  end
end
