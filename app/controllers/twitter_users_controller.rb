class TwitterUsersController < ApplicationController
  def new
    @twitter_user = TwitterUser.new
  end

  # def feed_redirect
  #
  # end

  private

  def twitter_user_params
    params.require(:twitter_user).permit(:screen_name)
  end
end
