class DeleteUserController < ApplicationController
    before_action { redirect_to(root_url) if !current_user.admin? }

    def destroy 
        user = User.find(params[:id]).destroy 
        redirect_back(fallback_location: root_path)
    end
end
