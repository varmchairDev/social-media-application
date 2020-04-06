before_action :set_user

def show
end

def friends
    @title = "Friends"
    @friends = @user.all_friends
end

private

def set_user
    @user = User.find(params[:id])
end
