class TweetController < ApplicationController
  # before_action :authenticate_user
  before_action :set_tweet, only: %i(edit update destroy)

  def index
    @tweet = Tweet.order("created_at DESC").page(params[:page]).per(6)
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

  def edit
  end

  def update
    if @tweet.update_attributes(tweet_params)
      redirect_to :tweet_index
    else
      @tweet.valid?
      render action: :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to :tweet_index
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :memo).merge(user: current_user)
  end

  def set_tweet
    @tweet = Tweet.find_by(id: params[:id])
  end
end
