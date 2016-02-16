require 'spec_helper'

describe 'feed', type: :feature do
  let(:twitter_user){ FactoryGirl.create(:twitter_user) }
  let(:tweet){ FactoryGirl.create(:tweet) }
  before{ twitter_user.tweets << tweet }

  context 'when logged out' do
    before{ visit "/feed/#{twitter_user.id}" }
    it_redirects_to_log_in_page
  end

  context 'when logged in' do
    before{ login }

    describe '/feed/:twitter_user_id' do
      before(:each){ visit "/feed/#{twitter_user.id}" }

      describe 'tweets' do
        it 'displays tweet url' do
          expect(page).to have_text 'https://twitter.com/MilesUA/status/572757724351492098'
        end
      end
    end
  end
end
