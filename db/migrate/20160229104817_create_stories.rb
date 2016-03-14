class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :level
      t.integer :number
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
