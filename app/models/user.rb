class User < ActiveRecord::Base
  attr_accessible :twitter_handle, :email,
                  :name, :bio, :url, :word_count,
                  :twitter_oauth_token,
                  :twitter_oauth_secret

  has_many :poems
  has_and_belongs_to_many :titles

  validates :twitter_handle, presence: true
  after_initialize :init

  def init
    self.word_count = 0
  end

  def add_to_word_count(amt)
    self.word_count += amt if amt > 0
  end
end
