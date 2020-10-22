class AddIndexOpinions < ActiveRecord::Migration[6.0]
  def change
    add_index :opinions, [:user_id, :created_at]
  end
end
