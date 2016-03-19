class CreateMyMails < ActiveRecord::Migration
  def change
    create_table :my_mails do |t|
      t.string :name
      t.string :email
      t.text :content

      t.timestamps null: false
    end
  end
end
