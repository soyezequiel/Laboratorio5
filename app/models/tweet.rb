class Tweet < ApplicationRecord
  belongs_to :monster
  def index
    @tweets = Tweet.order(:created_at)
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    @tweet=Tweet.new(tweet_params)
    if  @tweet.save
      redirect_to @tweet
    else
      render :new
    end
  end
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
