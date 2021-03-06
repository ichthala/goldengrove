class TwitterService

  def initialize(client = nil)
    @twitter = client || Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_SECRET"]
    end
  end

  def get_users(n)
    # Retrieve more usernames than you'll need because some may error out
    usernames = TwitterUser.sample(n + 20)
    users = []

    while users.size < n
      if username = usernames.pop
        begin
          user = @twitter.user(username)
          users << user
        rescue Twitter::Error => e
          puts "[TwitterService#get_users] Twitter returned an error:"
          puts e.message
        end
      else # We ran out of usernames, retrieve more
        usernames = TwitterUser.sample(n + 20)
      end
    end

    users
  end

  def get_tweets(username, n = 30)
    @twitter.user_timeline(username, count: n)
  end

  def share(options)
    user = options[:user]
    poem = options[:poem]

    token = user.twitter_oauth_token #||= ENV['YOUR_OAUTH_TOKEN']
    secret = user.twitter_oauth_secret #||= ENV['YOUR_OAUTH_TOKEN_SECRET']

    # xxx refac so second client isn't created
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = token
      config.access_token_secret = secret
    end

    tweet_text = "#gldgv "
    tweet_text << "#{poem.source_user} "
    tweet_text << "#{poem.text.truncate(90)} "
    tweet_text << "goldengrove.co/poems/#{poem.id}"
    # client.update(tweet_text)
    puts "TWEET TEXT"
    puts tweet_text
  end

end
