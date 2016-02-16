require 'spec_helper'

describe TwitterApi do
  let(:twitter_api){ TwitterApi.new }
  let(:screen_name){ 'MilesUA' }

  describe 'recent_tweets(screen_name)' do
    let(:tweets){ twitter_api.recent_tweets(screen_name) }
    let(:tweet){ tweets.last }

    it 'returns 20 recent tweets' do
      VCR.use_cassette 'twitter_api_timeline' do
        expect(tweets.count).to eq 20
      end
    end

    describe 'each tweet' do
      let(:tweet){ tweets.last }

      it 'is a twitter tweet' do
        VCR.use_cassette 'twitter_api_timeline' do
          expect(tweet.class).to eq Twitter::Tweet
        end
      end

      it 'has a url' do
        VCR.use_cassette 'twitter_api_timeline' do
          expect(tweet.url.to_s).to eq 'https://twitter.com/MilesUA/status/572757724351492098'
        end
      end
    end
  end

  describe 'oembed(url)' do
    let(:tweet){ FactoryGirl.create(:tweet) }
    let(:oembed){ twitter_api.oembed(tweet.url) }

    describe 'returned oembed object' do
      it 'has formatted html' do
        VCR.use_cassette 'twitter_api_oembed' do
          expect(oembed.html).to eq "<blockquote class=\"twitter-tweet\"><p lang=\"en\" dir=\"ltr\">In retrospect I&#39;m not sure I liked this season of <a href=\"https://twitter.com/hashtag/HouseOfCards?src=hash\">#HouseOfCards</a> as a whole</p>&mdash; Miles (@MilesUA) <a href=\"https://twitter.com/MilesUA/status/572757724351492098\">March 3, 2015</a></blockquote>\n"
        end
      end
    end
  end
end
