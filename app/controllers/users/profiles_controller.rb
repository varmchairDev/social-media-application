before_action :set_user

def show
end

def friends
    @friends = @user.friends
               .push(*@user.added_by_friends)
               .sort_by { |f| f.created_at }
               .reverse
end

private

def set_user
    @user = User.find(params[:id])
end
