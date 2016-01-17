class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :teacher, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.text :exercise
      t.text :content
      t.boolean :read

      t.timestamps null: false
    end
  end
end
