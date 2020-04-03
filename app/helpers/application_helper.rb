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

    def model_date(model)
        if model.updated_at > model.created_at
            "Created: #{model.created_at} | Updated: #{model.updated_at}"
        else  
            "Created: #{model.created_at}"
        end
    end
end
