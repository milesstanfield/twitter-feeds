class TwitterUser < ActiveRecord::Base
  validates :screen_name, uniqueness: true
  has_many :tweets

  def screen_name=(screen_name)
    super(screen_name.try(:downcase))
  end
end
