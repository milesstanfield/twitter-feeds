class TweetPresenter
  def initialize(tweet)
    tweet = tweet
    @oembed = TwitterApi.new.oembed(tweet.url)
  end

  def html
    @oembed.html
  end
end
