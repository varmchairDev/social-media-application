class AffairsController < ApplicationController
    before_action :only_users

    def create
        user_id = params[:befriend][:user_id]
        friend_id = params[:befriend][:friend_id]
        if User.find(user_id).blockers.include?(User.find(friend_id))
            flash[:error] = "Error! You're blocked by this user."
        elsif User.find(friend_id).blockers.include?(User.find(user_id))
            flash[:error] = "Error! You can't befriend user you've blocked."
        elsif Friend(user_id: user_id, friend_id: friend_id).save
            flash[:success] = "Congrats! You have a new friend!"
        else
            error[:error] = "Failed to befriend them :("
        end
    end

    def destroy
        user_id = params[:unfriend][:user_id]
        friend_id = params[:unfriend][:friend_id]
        if Friend.where("user_id = ? AND friend_id = ?", user_id, friend_id).destroy
            flash[:success] = "Unfriended user :("
        else
            error[:error] = "Error! Couldn't unfriend user."
        end
    end
end
