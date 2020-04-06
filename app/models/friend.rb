class Friend < ApplicationRecord
    before_create do
        User.find_by(user_id).all_friends << User.find_by(friend_id)
        User.find_by(friend_id).all_friends << User.find_by(user_id)
    end
    belongs_to :user
    belongs_to :friend, class_name: "User"
end
