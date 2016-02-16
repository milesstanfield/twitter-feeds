class FeedController < ApplicationController
  def show
    @tweets = TwitterUser.find(params[:twitter_user_id]).tweets
  end
end
