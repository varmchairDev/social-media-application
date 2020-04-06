class StaticPagesController < ApplicationController
  before_action :only_users

  def home
  end

  def index
    @users = User.all
    @title = "Users"
  end

  def trending
    @posts = Post.where("created_at < ?", 3.hours.ago)
             .sort_by { |p| p.liked_posts.count }.reverse.take(25)
  end

  def top
    @posts = Post.all.sort_by { |p| p.liked_posts.count }
             .reverse.take(25)
  end

  def new 
    @posts = Post.where("created_at < ?", 1.hour.ago)
             .sort_by { |p| p.created_at }.reverse.take(25)
  end

end
