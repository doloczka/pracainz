class CreateMedals < ActiveRecord::Migration
  def change
    create_table :medals do |t|
      t.text :name
      t.text :description
      t.string :img
      t.integer :value

      t.timestamps null: false
    end
  end
end
