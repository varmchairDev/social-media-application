class PostsController < ApplicationController
  before_action :only_users
  before_action :correct_user, only: [:edit, :update]
  before_action :auth_check, only: [:destroy]
  before_action :set_post, only: [:edit, :update,
                                  :destroy, :show]

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
  end

  def update
    @post.update_attributes(post_params)
    if @post.save 
      redirect_to @post 
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  def show
  end


  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
