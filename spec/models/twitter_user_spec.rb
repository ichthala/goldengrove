require 'spec_helper'

describe TwitterUser do

  describe '.sample' do

    it 'never returns duplicates' do
      # xxx i should not need to include this line. why do i need to?
      TwitterUser.destroy_all

      TwitterUser.create! screen_name: 'foo_1'
      TwitterUser.create! screen_name: 'foo_2'

      100.times do |n|
        expect(TwitterUser.sample 2).to match_array ['foo_1', 'foo_2']
      end
    end

  end

end