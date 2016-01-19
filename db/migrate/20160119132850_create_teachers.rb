class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :login
      t.string :password_diggest
      t.string :
      t.string :name
      t.string :lastname
      t.string :email

      t.timestamps null: false
    end
    add_index :teachers, :login, unique: true
  end
end
