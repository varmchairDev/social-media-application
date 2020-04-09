class LikingPostsController < ApplicationController
    before_action :only_users

    def create
        like_something("post")
    end
end
