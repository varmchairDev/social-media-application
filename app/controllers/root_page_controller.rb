class RootPageController < ApplicationController
  
  def welcome
    if current_user
      redirect_to home_path
    else
      redirect_to "/users/sign_in"
    end
  end

end
