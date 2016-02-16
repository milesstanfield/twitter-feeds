if Rails.env.development?
  FactoryGirl.create(:user)
  twitter_user = FactoryGirl.create(:twitter_user)
  twitter_user.tweets << FactoryGirl.create(:tweet, url: 'https://twitter.com/MilesUA/status/567361134605651968')
  twitter_user.tweets << FactoryGirl.create(:tweet)
  puts 'done'
end
