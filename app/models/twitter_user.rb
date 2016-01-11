class TwitterUser < ActiveRecord::Base
  # attr_accessible :screen_name

  # xxx add error for case n < TwitterUser.all.size
  def self.sample(n = 10)
    limit(n).order('RANDOM()').pluck('screen_name')
  end

end
