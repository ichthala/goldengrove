class User < ActiveRecord::Base
  has_many :poems
  has_many :user_titles
  has_many :titles, through: :user_titles

  validates :twitter_handle, presence: true
  after_initialize :init

  ##-- Class Methods --##

  def self.from_omniauth(auth)
    where(auth.slice('provider', 'uid')).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.twitter_handle = auth['info']['nickname']
      user.twitter_oauth_token = auth['credentials']['token']
      user.twitter_oauth_secret = auth['credentials']['secret']
    end
  end

  ##-- Instance Methods --##

  def init
    self.word_count = 0
  end

  def add_to_word_count(amt)
    self.word_count += amt if amt > 0
  end
end
