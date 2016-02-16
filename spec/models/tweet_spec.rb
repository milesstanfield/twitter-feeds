require 'spec_helper'

describe Tweet do
  describe 'attributes' do
    it_has_attributes 'url', 'twitter_user_id'
  end
end
