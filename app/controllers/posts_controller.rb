class PostsController < ApplicationController
  before_action :only_users
  
  before_action only: [:edit, :update] do
    correct_user(find_post)
  end

  before_action only: [:destroy] do 
    auth_check(find_post)
  end

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
    @comment = current_user.comments.build
  end


  private

  def find_post
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = find_post
  end

end
