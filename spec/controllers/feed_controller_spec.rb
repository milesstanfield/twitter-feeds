require 'spec_helper'

describe FeedController, type: :controller do
  describe '#show' do
    it 'renders show template' do
      tweets = double(:tweets)
      twitter_user = double(:twitter_user)
      expect(TwitterUser).to receive(:find).with('123').and_return(twitter_user)
      expect(twitter_user).to receive(:tweets).and_return(tweets)
      get :show, twitter_user_id: '123'
      expect(response).to render_template :show
      expect(assigns(:tweets)).to eq tweets
    end
  end
end
