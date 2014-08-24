require 'spec_helper'
require 'twitter_service'

describe TwitterService do

  describe '#get_users_from_username' do

    it 'returns given number of users' do
      Twitter::REST::Client.any_instance.stub(:user).and_return('username')
    end

    context 'when a given user returns an error' do

      it 'returns given number of users' do
      end

    end

  end

end