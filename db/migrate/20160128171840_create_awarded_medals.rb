class CreateAwardedMedals < ActiveRecord::Migration
  def change
    create_table :awarded_medals do |t|
      t.integer :student_id
      t.integer :medal_id

      t.timestamps null: false
    end
      add_index :awarded_medals, [:student_id, :medal_id], unique: true
  end
end
