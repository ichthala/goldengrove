require 'spec_helper'

describe UsersController do

  describe '#show' do
    context 'json request' do
      it 'returns a user' do
        user = create :user
        get :show, id: user, format: :json
        expect(response.body).to eq user.to_json
      end
    end
  end

end
