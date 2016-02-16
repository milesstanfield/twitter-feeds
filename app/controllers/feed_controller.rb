class FeedController < ApplicationController
  before_action :authenticate_user!

  def show
    @tweets = TwitterUser.find(params[:twitter_user_id]).tweets
  end
end
