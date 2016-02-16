require 'spec_helper'

describe FeedController, type: :controller do
  context 'when logged out' do
    it 'renders show template' do
      get :show, twitter_user_id: '123'
      expect(response).to redirect_to '/users/sign_in'
    end
  end

  context 'when logged in' do
    before(:each){ sign_in :user, FactoryGirl.create(:user) }

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
end
