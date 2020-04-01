class StaticPagesController < ApplicationController
  before_action :only_users

  def home
  end

  def index
    @users = User.all
  end

  def trending
    @posts = Post.where("created_at > ?", 3.hours.ago)
             .sort_by { |p| p.like_posts.count }.reverse!
  end

  def top
    @posts = Post.all.sort_by { |p| p.like_posts.count }.reverse!
  end

end
