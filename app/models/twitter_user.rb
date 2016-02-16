class TwitterUser < ActiveRecord::Base
  validates :screen_name, uniqueness: true
  has_many :tweets
end
