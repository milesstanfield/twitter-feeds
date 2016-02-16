class TwitterClient
  def standard
    Twitter::REST::Client.new(
      consumer_key:           ENV.fetch('NAMETHISTWEET_TWITTER_CONSUMER_KEY'),
      consumer_secret:        ENV.fetch('NAMETHISTWEET_TWITTER_CONSUMER_SECRET'),
      access_token:           ENV.fetch('NAMETHISTWEET_TWITTER_ACCESS_TOKEN'),
      access_token_secret:    ENV.fetch('NAMETHISTWEET_TWITTER_ACCESS_TOKEN_SECRET')
    )
  end
end
