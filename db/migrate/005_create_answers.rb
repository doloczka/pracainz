class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :teacher, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.references :exercise, index: true, foreign_key: true
      t.text :solution
      t.integer :reward
      t.boolean :read

      t.timestamps null: false
    end
  end
end
