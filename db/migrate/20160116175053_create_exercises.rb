class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.references :lesson, index: true, foreign_key: true
      t.integer :number
      t.integer :reward
      t.text :story
      t.text :content
      t.text :hint

      t.timestamps null: false
    end
  end
end
