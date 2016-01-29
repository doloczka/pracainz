class CreateProgres < ActiveRecord::Migration
  def change
    create_table :progres do |t|
      t.references :student, index: true, foreign_key: true
      t.integer :points
      t.integer :hp
      t.integer :gained_points
      t.integer :lvl
      t.integer :won_challenges
      t.integer :lost_challenges

      t.timestamps null: false
    end
  end
end
