module ApplicationHelper
    def only_users
        redirect_to "users/sign_in" if !current_user
    end

    def correct_user(model) #accepts object instance as arg.
        redirect_to(root_url) unless current_user == model.user
    end
    
    def auth_check(model) #accepts object instance as arg.
        if current_user.admin?
        else
          correct_user(model)
        end
    end

    def model_date(model) #accepts object instance as arg.
        if model.updated_at > model.created_at
            "Created: #{model.created_at} | Updated: #{model.updated_at}"
        else  
            "Created: #{model.created_at}"
        end
    end

    def like_something(like_what) #accepts string argument.
        user_id = params[:like_something][:user_id]
        like_id = params[:like_something]["#{like_what}_id".to_sym]
        class_name = "Like#{like_what.capitalize}".constantize
        if class_name.new(:user_id => user_id, "#{like_what}_id".to_sym => like_id).save
            flash[:success] = "Liked!"
        else
            flash[:error] = "Failed to like :("
        end
        redirect_back(fallback_location: root_url)
    end

    def get_friends(user)
        Friend.where("user_id = ? OR friend_id = ?", user.id)
              .order(desc: :created_at)
              .map { |f| f.user_id != user.id ? User.find(f.user_id) : User.find(f.friend_id) }
    end
end
