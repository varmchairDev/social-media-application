class PostsController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :auth_check, only: [:destroy]

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end


  private

  def correct_user
    redirect_to(root_url) unless current_user == Post.find(params[:id])
  end

  def auth_check
    if current_user.admin?
    else
      correct_user
    end
  end
end
