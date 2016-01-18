class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :content
      t.boolean :read
      t.boolean :direction
      t.references :student_id 
      t.references :teacher_id

      t.timestamps null: false
    end
  end
end
