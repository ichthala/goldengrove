class TwitterUser < ActiveRecord::Base
  attr_accessible :screen_name

  # xxx add error for case n < TwitterUser.all.size
  def self.sample(n = 10)
    usernames = []
    offsets = Set.new
    count = TwitterUser.count

    n.times do |num|
      offset = rand(count)
      while offsets.include?(offset)
        offset = rand(count)
      end
      usernames << TwitterUser.first(offset: offset).screen_name
      offsets << offset
    end

    usernames
  end

end
