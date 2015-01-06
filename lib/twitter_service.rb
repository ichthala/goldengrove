class TwitterService

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_SECRET"]
    end
  end

  def get_users(n)
    usernames = TwitterUser.sample(n)
    users = []

    usernames.each do |username|
      user = nil
      i = 0
      while user.nil? && i < 5
        begin
          user = @client.user(username)
        rescue Twitter::Error => e
          puts "\n\n\n\n\nWE GOT AN ERROR"
          puts e.message
        ensure
          i += 1
        end
      end
      users << user
    end

    users
  end

  def get_tweets(username, n = 30)
    @client.user_timeline(username, count: n)
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
