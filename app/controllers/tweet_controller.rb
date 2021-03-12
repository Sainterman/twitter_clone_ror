class TweetController < ApplicationController
    def index
    end

    def new
        @tweet = Tweet.new
    end
    
    def create
        @tweet = Tweet.new(tweet_params)
        if @tweet.save
            redirect_to(@tweet)
        else
            render :new
        end
    end
    
    private

    def tweet_params
        params.require(:tweet).permit(:content, :user_id)
    end

end
