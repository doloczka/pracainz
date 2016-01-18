class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :level
      t.integer :number
      t.integer :reward
      t.text :content
      t.text :hint

      t.timestamps null: false
    end
  end
end
