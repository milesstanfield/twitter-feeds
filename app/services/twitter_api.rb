class TwitterApi
  attr_reader :client

  def initialize
    @client = TwitterClient.new.standard
  end

  def recent_tweets(screen_name)
    client.user_timeline screen_name
  end
end
