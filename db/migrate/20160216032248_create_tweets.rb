class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :url
      t.integer :twitter_user_id
    end
  end
end
