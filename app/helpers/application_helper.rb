module ApplicationHelper
    def only_users
        redirect_to "users/sign_in" if !current_user
    end

    def correct_user(model)
        redirect_to(root_url) unless current_user == model.user
    end
    
    def auth_check(model)
        if current_user.admin?
        else
          correct_user(model)
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
