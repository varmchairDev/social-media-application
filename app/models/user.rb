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
  has_many :sended_requests, class_name: "Friend",
                             foreign_key: "user_id",
                             dependent: :destroy

  has_many :received_requests, class_name: "Friend",
                                    foreign_key: "friend_id",
                                    dependent: :destroy

  has_many :friends, through: :sended_requests
  has_many :added_by_friends, through: :received_requests, 
                              source: :user
  
end
