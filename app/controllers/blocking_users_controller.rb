class BlockingUsersController < ApplicationController
    before_action :only_users

    def create 
        blocker_id = params[:block][:blocker_id]
        blocked_id = params[:block][:blocked_id]
        if BlockingUser.new(blocker_id, blocked_id).save
            if (f = Friend.where("user_id = ? AND friend_id = ?", blocker_id, blocked_id))
                if f.destroy
                else
                    flash[:error] = "Failed to block." 
                    redirect_back(fallback_location: root_url)
                end
            end
            flash[:success] = "User blocked!"
        else
            flash[:error] = "Failed to block."
        end
        redirect_back(fallback_location: root_url)
    end

    def destroy
        blocker_id = params[:block][:blocker_id]
        blocked_id = params[:block][:blocked_id]
        if BlockingUser.where("blocker_id = ? AND blocked_id = ?", blocker_id, blocked_id).destroy
            flash[:success] = "User unblocked!"
        else
            flash[:error] = "Failed to unblock."
        end
        redirect_back(fallback_location: root_url)
    end
end
