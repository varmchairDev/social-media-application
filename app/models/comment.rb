class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :liked_comments, class_name: "LikeComment",
                            foreign_key: "comment_id",
                            dependent: :destroy

  validates :user_id, presence: true
  validates :post_id, presence: true
end
