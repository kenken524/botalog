class AddUniqueConstraintToLikes < ActiveRecord::Migration[6.0]
  def change
    add_index :likes, [:likable_type, :likable_id, :user_id], unique: true, name: 'unique_like_index'
  end
end



