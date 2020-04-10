class AddIndexToLikeComments < ActiveRecord::Migration[5.2]
  def change
    add_index :like_comments, [:user_id, :comment_id], unique: true
  end
end
