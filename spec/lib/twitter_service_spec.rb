require 'spec_helper'
require 'twitter_service'

describe TwitterService do

  describe '#get_users' do

    let :client do
      double('Twitter::REST::Client', user: 'user')
    end

    let :ts do
      TwitterService.new(client)
    end

    before do
      allow(TwitterUser).to receive(:sample) { ['username1', 'username2'] }
    end

    it 'pulls the expected number of usernames from the database' do
      user_count = 2
      expect(TwitterUser).to receive(:sample).once.with(user_count + 20)
      ts.get_users(user_count)
    end

    it 'requests users from Twitter' do
      expect(client).to receive(:user).with('username1')
      expect(client).to receive(:user).with('username2')
      ts.get_users(2)
    end

    context 'when a username returns an error' do

      let :client do
        dbl = double('Twitter::REST::Client')
        times_called = 0
        dbl.stub(:user) do
          times_called += 1
          raise Twitter::Error if times_called <= 1
          "user#{times_called}"
        end
        dbl
      end

      it 'returns given number of users' do
        expect(ts.get_users(2)).to eq(['user2', 'user3'])
      end

    end

  end

end
