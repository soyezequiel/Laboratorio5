class TweetsController < ApplicationController

def index
    @tweets = Tweet.order(:created_at)
  end

def show
    @tweet = Tweet.find(params[:id])
  end
def new
    @tweetNuevo=Tweet.new
end

def create
    @tweetNuevo=Tweet.new(tweet_params)
    if  (@tweetNuevo.save)
      redirect_to @tweetNuevo, notice: "todo legal"
    else
      puts "error"
      render :new
    end
end
def tweet_params
    params.require(:tweet).permit(:content, :monster_id)
  end
end
