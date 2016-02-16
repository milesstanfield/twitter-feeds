require 'spec_helper'

describe TwitterUser do
  let(:twitter_user){ FactoryGirl.create(:twitter_user) }

  describe 'attributes' do
    it 'has a screen_name' do
      expect(twitter_user.screen_name).to be_truthy
    end
  end

  describe 'validations' do
    it 'ensures a unique screen_name' do
      expect {FactoryGirl.create(:twitter_user, screen_name: twitter_user.screen_name)}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
