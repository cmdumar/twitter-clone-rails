class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :user_id
      t.integer :opinion_id

      t.timestamps
    end
    add_index :comments, :opinion_id
    add_foreign_key :comments, :users, column: :user_id
  end
end
