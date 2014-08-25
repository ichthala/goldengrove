require 'spec_helper'
require 'twitter_service'

describe TwitterService do

  describe '#get_users' do

    before do
      @ts = TwitterService.new
    end

    # xxx not sure how i feel about this spec, since it doesn't test
    # interaction with the db
    it 'returns expected users' do
      users = [
        Twitter::User.new(:id => 1, :screen_name => 'foo_1'),
        Twitter::User.new(:id => 2, :screen_name => 'foo_2')
      ]

      Twitter::REST::Client.any_instance.stub(:user).and_return(*users)

      expect(@ts.get_users 2).to eq users
    end

    context 'when username returns an error' do

      it 'returns given number of users' do
        user = Twitter::User.new(:id => 1, :screen_name => 'foo_1')

        times_called = 0
        Twitter::REST::Client.any_instance.stub(:user).and_return do
          times_called += 1
          raise Twitter::Error if times_called <= 1
          user
        end

        expect(@ts.get_users 1).to eq [user]
      end

    end

  end

end