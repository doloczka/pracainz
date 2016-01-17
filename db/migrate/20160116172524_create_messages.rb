class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :content
      t.boolean :read
      t.integer :sender
      t.integer :recipient

      t.timestamps null: false
    end
  end
end
