class LikingCommentsController < ApplicationController
    before_action :only_users

    def create
        like_something("comment")
    end
end
