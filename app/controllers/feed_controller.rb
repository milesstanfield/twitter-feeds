class FeedController < ApplicationController
  before_action :authenticate_user!

  def show
    tweets = TwitterUser.find(params[:twitter_user_id]).tweets
    @presented_tweets = presented_tweets(tweets)
  end

  private

  def presented_tweets(tweets)
    tweets.map {|tweet| TweetPresenter.new(tweet) }
  end
end
