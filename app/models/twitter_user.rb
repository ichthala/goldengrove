class TwitterUser < ActiveRecord::Base
  attr_accessible :screen_name

  def self.sample(n = 10)
    usernames = []
    offsets = []
    count = TwitterUser.count

    n.times do |num|
      offset = rand(count)
      while offsets.include?(offset)
        offset = rand(count)
      end
      usernames << TwitterUser.first(offset: offset).screen_name
    end

    usernames
  end

end
