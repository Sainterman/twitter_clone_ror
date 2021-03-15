class UserController < ApplicationController
    def index
        @tweets = current_user.tweets
        @followers = current_user.followers
    end

    def new
    end

    def search
        @user = User.new
    end

    def follow
        @user = User.find_by(username: params[:username])
        current_user.follow(@user)
    end
end
