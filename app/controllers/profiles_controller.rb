class ProfilesController < ApplicationController

    before_action :set_user

    def show
    end

    def friends
        @title = "Friends"
        @users = get_friends(@user)
    end

    def user_posts
        @posts = Post.where("user_id = ?", @user.id)
    end

    def user_comments
        @comments = Comment.where("user_id = ?", @user.id)
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

end
