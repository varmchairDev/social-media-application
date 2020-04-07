class ApplicationController < ActionController::Base
    protect_from_forgery
    include ApplicationHelper

    def after_sign_in_path_for(resource)
        if resource.is_a?(User) && resource.confirmed? && resource.locked_at?
            redirect_to home_path
        else
            redirect_to root_path
        end
    end
end
