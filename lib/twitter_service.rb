class TwitterService

  attr_accessor :client

  def initialize
    client = Twitter::Client.new(
      consumer_key: ENV['YOUR_CONSUMER_KEY'],
      consumer_secret: ENV['YOUR_CONSUMER_SECRET'],
      oauth_token: ENV['ACCESS_TOKEN'],
      oauth_token_secret: ENV['ACCESS_TOKEN_SECRET']
    )
  end

  def get_users_from_usernames(usernames)
    users = []
    usernames.each do |username|
      users << client.user(username)
    end
    users
  end

end