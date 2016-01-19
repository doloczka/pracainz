class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :student, index: true, foreign_key: true
      t.integer :level
      t.references :exercise, index: true, foreign_key: true
      t.integer :earned_points

      t.timestamps null: false
    end
  end
end
