class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :login
      t.string :password_digest
      t.string :email
      t.string :name
      t.string :lastname
      t.integer :albumnumber
      t.boolean :authenticated
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
