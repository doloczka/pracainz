class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.date :zajecia1
      t.date :zajecia2
      t.date :zajecia3
      t.date :zajecia4
      t.date :zajecia5
      t.date :zajecia6
      t.references :teacher, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
