class CreateSidequests < ActiveRecord::Migration
  def change
    create_table :sidequests do |t|
      t.references :teacher, index: true, foreign_key: true
      t.integer :level
      t.text :content
      t.integer :reward
      t.boolean :finished
      t.datetime :finish
      t.timestamps null: false
    end
  end
end
