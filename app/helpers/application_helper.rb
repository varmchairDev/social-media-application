module ApplicationHelper
    def only_users
        redirect_to(root_url) if !current_user
    end

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
