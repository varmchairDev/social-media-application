class StaticPagesController < ApplicationController
  before_action :only_users

  def home
  end

  def index
    @users = User.all
  end

  def trending
  end

  def top
  end

end
