class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :twitter_handle
      t.string :name
      t.text :bio
      t.string :url
      t.integer :word_count
      t.string :twitter_oauth_token
      t.string :twitter_oauth_secret

      t.timestamps
    end
  end
end
