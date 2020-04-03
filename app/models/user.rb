class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :trackable, :confirmable, :lockable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :like_posts, dependent: :destroy
  has_many :like_comments, dependent: :destroy
  has_many :friend_requests, class_name: "Friend",
                             foreign_key: "user_id",
                             dependent: :destroy

  has_many :friendship_invitations, class_name: "Friend",
                                    foreign_key: "friend_id",
                                    dependent: :destroy

  has_many :friends, through: :friend_requests
  has_many :added_to_friends, through: :friendship_invitations, 
                              source: :user
  
end
