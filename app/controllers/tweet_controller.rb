class TweetController < ApplicationController
    def index
    end

    def new
        @tweet = Tweet.new
    end
    
    def show

    end

    def create
        @tweet = Tweet.new
        @tweet.content = tweet_params[:content]
        @tweet.user_id = current_user.id
        if @tweet.save
            flash[:notice] = "Tweet posted"
            redirect_to :root
        else
            render :new
        end
    end
    
    private

    def tweet_params
        params.require(:tweet).permit(:content)
    end

end
