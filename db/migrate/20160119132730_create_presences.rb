class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.references :student, index: true, foreign_key: true
      t.integer :classes_number
      t.boolean :present

      t.timestamps null: false
    end
  end
end
