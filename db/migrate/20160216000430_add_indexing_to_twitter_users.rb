class AddIndexingToTwitterUsers < ActiveRecord::Migration
  def change
    add_index :twitter_users, :screen_name
  end
end
