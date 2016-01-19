class CreateDrawnexercises < ActiveRecord::Migration
  def change
    create_table :drawnexercises do |t|
      t.references :student, index: true, foreign_key: true
      t.integer :level
      t.integer :number
      t.references :exercise, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
