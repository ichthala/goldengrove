namespace :twitter do
  desc "Streams Twitter usernames into the database"
  task :stream => :environment do

    require 'tweetstream'

    TwitterUser.delete_all

    TweetStream.configure do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.oauth_token = ENV['ACCESS_TOKEN']
      config.oauth_token_secret = ENV['ACCESS_TOKEN_SECRET']
      config.auth_method        = :oauth
    end

    puts "about to stream"

    client = TweetStream::Client.new
    puts client

    users_i_like = [
      'ichthala',
      'wescarr17',
      'seraphicmanta',
      'catlandbooks',
      'stefanoblackest'
    ]

    users_i_like.each do |user|
      puts user
      TwitterUser.create(screen_name: user)
    end

    client.sample do |status|
      if status.lang == "en"
        puts "#{status.user.screen_name}"
        TwitterUser.create(screen_name: status.user.screen_name)
      end
    end



    client.on_limit do |skip_count|
      # do something
      puts "limited"
    end

    client.on_error do |err|
      puts err
    end

    client.on_enhance_your_calm do
      # do something
      puts "enhance calm"
    end

    client.control.info do |info|
      # do something
      puts info
    end

  end

end
