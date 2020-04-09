class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :liked_posts, class_name: "LikePost",
                         foreign_key: "post_id", 
                         dependent: :destroy

  validates :user_id, presence: true
end
