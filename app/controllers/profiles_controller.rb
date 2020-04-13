class ProfilesController < ApplicationController

    before_action :set_user

    def show
    end

    def friends
        @title = "Friends"
        @users = get_friends(@user)
    end

    def user_posts
        @posts = Post.where("user_id = ?", @user.id).order(created_at: :desc)
    end

    def user_comments
        @comments = Comment.where("user_id = ?", @user.id).order(created_at: :desc)
    end

    def liked_posts
        @posts = LikePost.where("user_id = ?", @user.id).order(created_at: :desc)
                 .map { |p| Post.find(p.post_id) }
    end

    def liked_comments
        @comments = LikeComment.where("user_id = ?", @user.id).order(created_at: :desc)
                    .map { |c| Comment.find(c.comment_id) }
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

end
