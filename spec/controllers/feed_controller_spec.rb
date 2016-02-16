require 'spec_helper'

describe FeedController, type: :controller do
  describe '#show' do
    it 'renders show template' do
      get :show, twitter_user_id: '123'
      expect(response).to render_template :show
    end
  end
end
