class CreateSqresults < ActiveRecord::Migration
  def change
    create_table :sqresults do |t|
      t.references :student, index: true, foreign_key: true
      t.references :sidequest, index: true, foreign_key: true
      t.integer :level
      t.integer :earned_points

      t.timestamps null: false
    end
  end
end
