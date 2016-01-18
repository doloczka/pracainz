class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.date :date
      t.references :teacher, index: true, foreign_key: true
      t.boolean :active
      t.timestamps null: false
    end
  end
end
