class AddIndexToLikePosts < ActiveRecord::Migration[5.2]
  def change
    add_index :like_posts, [:user_id, :post_id], unique: true
  end
end
