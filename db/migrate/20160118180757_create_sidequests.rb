class CreateSidequests < ActiveRecord::Migration
  def change
    create_table :sidequests do |t|
      t.references :teacher, index: true, foreign_key: true
      t.integer :level
      t.text :content
      t.integer :challenger_id
      t.text :challenger_answer
      t.integer :recipient_id
      t.text :recipient_answer

      t.timestamps null: false
    end
  end
end
