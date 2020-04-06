class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :all_friends

  before_create { @all_friends = [] }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :trackable, :confirmable, :lockable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :liked_posts, class_name: "LikePost", 
                         foreign_key: "user_id",
                         dependent: :destroy

  has_many :liked_comments, class_name: "LikeComment", 
                            foreign_key: "user_id",
                            dependent: :destroy

  has_many :sended_requests, class_name: "Friend",
                             foreign_key: "user_id",
                             dependent: :destroy

  has_many :received_requests, class_name: "Friend",
                                    foreign_key: "friend_id",
                                    dependent: :destroy

  has_many :added_friends, through: :sended_requests
  has_many :added_by_friends, through: :received_requests, 
                              source: :user

  has_many :blocker_tables, class_name: "BlockingUser",
                       foreign_key: "blocker_id",
                       dependent: :destroy

  has_many :blocked_tables, class_name: "BlockingUser",
                      foreign_key: "blocked_id",
                      dependent: :destroy

  has_many :blocked_users, through: :blocker_tables, 
                           source: :blocked
                           
  has_many :blockers, through: :blocked_tables
  
end
