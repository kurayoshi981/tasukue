class TweetController < ApplicationController
  # before_action :authenticate_user

  def index
    @tweet = Tweet.order("created_at ASC").page(params[:page]).per(6)
    # @tweet = Tweet.find_by(id: params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to :tweet_index
    else
      @tweet.valid?
      render action: :new
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :memo).merge(user: current_user)
  end
end
