class TwitterUser < ActiveRecord::Base
  validates :screen_name, uniqueness: true
end
