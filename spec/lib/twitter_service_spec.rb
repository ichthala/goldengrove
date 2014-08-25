require 'spec_helper'
require 'twitter_service'

describe TwitterService do

  describe '#get_users' do

    it 'returns given number of users' do
      TwitterUser.create! screen_name: 'foo_1'
      TwitterUser.create! screen_name: 'foo_2'
      TwitterUser.create! screen_name: 'foo_3'

      ts = TwitterService.new

      users = [
        Twitter::User.new(:id => 1, :screen_name => 'foo_1'),
        Twitter::User.new(:id => 2, :screen_name => 'foo_2'),
        Twitter::User.new(:id => 3, :screen_name => 'foo_3')
      ]

      Twitter::REST::Client.any_instance.stub(:user).and_return(*users)

      expect(ts.get_users(3)).to eq users
    end

    context 'when username returns an error' do

      it 'returns given number of users' do
        TwitterUser.create! screen_name: 'foo_1'

        ts = TwitterService.new

        user = Twitter::User.new(:id => 1, :screen_name => 'foo_1')

        responses = [
          Twitter::Error.new,
          user
        ]

        Twitter::REST::Client.any_instance.stub(:user).and_return(*responses)

        expect(ts.get_users 1).to eq user

      end

    end

  end

end