class TwitterService

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_SECRET"]
    end
  end

  def get_users_from_usernames(usernames)
    users = []
    usernames.each do |username|
      users << @client.user(username)
    end
    users
  end

  def get_tweets(username, n = 30)
    @client.user_timeline(username, count: n)
  end

end