class User < ActiveRecord::Base
  attr_accessible :twitter_handle,
  								:name, :bio, :url, :word_count,
  								:twitter_oauth_token,
                  :twitter_oauth_secret

  has_many :poems
  has_and_belongs_to_many :titles

  validates :twitter_handle, presence: true
end
