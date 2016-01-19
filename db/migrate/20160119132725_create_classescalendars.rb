class CreateClassescalendars < ActiveRecord::Migration
  def change
    create_table :classescalendars do |t|
      t.references :group, index: true, foreign_key: true
      t.integer :classes_number
      t.datetime :start
      t.datetime :end

      t.timestamps null: false
    end
  end
end
