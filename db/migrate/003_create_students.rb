class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :login
      t.string :password_digest
      t.string :email, unique: true
      t.string :name
      t.string :lastname
      t.string :album_number, unique: true
      t.references :group, index: true, foreign_key: true
      t.boolean :autenticated

      t.timestamps null: false
    end
    add_index :students, :login, unique: true
  end
end
