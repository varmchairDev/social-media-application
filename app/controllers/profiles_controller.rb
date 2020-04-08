class ProfilesController < ApplicationController

    before_action :set_user

    def show
    end

    def friends
        @title = "Friends"
        @users = Friend.where("user_id = ? OR friend_id = ?", @user.id)
                .order(desc: :created_at)
                .map { |f| f.user_id != @user.id ? User.find(f.user_id) : User.find(f.friend_id) }
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

end
