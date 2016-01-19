class CreateMedals < ActiveRecord::Migration
  def change
    create_table :medals do |t|
      t.references :student, index: true, foreign_key: true
      t.integer :medal_number

      t.timestamps null: false
    end
  end
end
