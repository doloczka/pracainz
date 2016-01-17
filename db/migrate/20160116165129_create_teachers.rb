class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :lastname
      t.string :login
      t.string :password_digest
      t.string :email

      t.timestamps null: false
    end
    add_index :teachers, :login, unique: true
  end
end
