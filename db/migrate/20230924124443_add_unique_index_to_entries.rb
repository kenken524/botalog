class AddUniqueIndexToEntries < ActiveRecord::Migration[6.0]
  def change
    add_index :entries, [:user_id, :room_id], unique: true
  end
end
