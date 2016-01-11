require 'spec_helper'

describe UsersController do

  describe '#show' do
    context 'json request' do
      it 'returns a user' do
        user = create :user
        get :show, id: user, format: :json
        expect(response.body).to eq ActiveModel::SerializableResource.new(user).to_json
      end

      it "does not return a user's twitter_oauth_token" do
        user = create :user
        get :show, id: user, format: :json
        expect(JSON.parse(response.body).keys).not_to include 'twitter_oauth_token'
      end

      it "does not return a user's twitter_oauth_secret" do
        user = create :user
        get :show, id: user, format: :json
        expect(JSON.parse(response.body).keys).not_to include 'twitter_oauth_secret'
      end

      it "includes a user's poems" do
        poem = create :poem
        user = poem.user
        get :show, id: user, format: :json
        expect(JSON.parse(response.body).keys).to include 'poems'
      end
    end
  end

end
