VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true

  # you can chose to have a vcr match on certain criteria
  # find other matchers at https://www.relishapp.com/vcr/vcr/v/1-6-0/docs/cassettes/request-matching
  c.default_cassette_options = {
    match_requests_on: [:uri]
  }

  # this is how you protect secrets from being in the repo
  c.filter_sensitive_data("ENV['NAMETHISTWEET_TWITTER_CONSUMER_KEY']") do
    ENV['NAMETHISTWEET_TWITTER_CONSUMER_KEY']
  end
  c.filter_sensitive_data("ENV['NAMETHISTWEET_TWITTER_CONSUMER_SECRET']") do
    ENV['NAMETHISTWEET_TWITTER_CONSUMER_SECRET']
  end
  c.filter_sensitive_data("ENV['NAMETHISTWEET_TWITTER_ACCESS_TOKEN']") do
    ENV['NAMETHISTWEET_TWITTER_ACCESS_TOKEN']
  end
  c.filter_sensitive_data("ENV['NAMETHISTWEET_TWITTER_ACCESS_TOKEN_SECRET']") do
    ENV['NAMETHISTWEET_TWITTER_ACCESS_TOKEN_SECRET']
  end
end
