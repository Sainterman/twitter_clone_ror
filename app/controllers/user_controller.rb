class UserController < ApplicationController
    def index
        set_user_profile(current_user)
    end

    def new
    end

    def show
        @user = User.find_by(id: params[:id])
        set_user_profile(@user)
    end

    def search
        @user = User.new
    end

    def follow
        @user = User.find_by(username: params[:username])
        current_user.follow(@user)
    end

    def set_user_profile(user)
        @tweets = user.tweets
        @followers = user.followers
        @followees = user.followees
    end
end
