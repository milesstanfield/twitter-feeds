class TwitterUsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @twitter_user = TwitterUser.new
  end

  def create
    @twitter_user = TwitterUser.first_or_create(twitter_user_params)
    redirect_to feed_path(@twitter_user)
  end

  private

  def twitter_user_params
    params.require(:twitter_user).permit(:screen_name)
  end
end
