require 'spec_helper'

describe 'nav', type: :feature do
  before(:each){ login }

  describe '/' do
    before{ visit '/' }

    it 'has a nav' do
      expect(page).to have_css 'nav'
    end
  end

  describe '/feed/:twitter_user_id' do
    xit 'has user\'s screen_name' do
    end
  end
end
