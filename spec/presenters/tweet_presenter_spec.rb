require 'spec_helper'

describe TweetPresenter do
  describe '.html' do
    it 'returns formatted html of tweet' do
      VCR.use_cassette 'twitter_api_oembed' do
        presented_tweet = TweetPresenter.new(FactoryGirl.create(:tweet))
        expect(presented_tweet.html).to eq "<blockquote class=\"twitter-tweet\"><p lang=\"en\" dir=\"ltr\">In retrospect I&#39;m not sure I liked this season of <a href=\"https://twitter.com/hashtag/HouseOfCards?src=hash\">#HouseOfCards</a> as a whole</p>&mdash; Miles (@MilesUA) <a href=\"https://twitter.com/MilesUA/status/572757724351492098\">March 3, 2015</a></blockquote>\n"
      end
    end
  end
end
