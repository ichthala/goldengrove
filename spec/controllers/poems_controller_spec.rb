require 'spec_helper'

describe PoemsController do

  describe 'GET #index' do
    it 'populates an array of poems' do
      poem = create(:poem)
      get :index
      expect(assigns(:poems)).to match_array([poem])
    end

    it 'returns the 30 most recent poems'

    it 'renders the index (Salon) view' do
      get :index
      expect(response).to render_template :index
    end

    context 'json request' do
      it 'returns poems in expected format' do
        poem = create :poem
        get :index, format: :json
        expect(response.body).to eq ActiveModel::SerializableResource.new([poem]).to_json
      end
    end
  end

  describe 'GET #random_users' do
    it 'populates an array of 9 random users + horse_ebooks'
  end

  describe 'POST #create' do
    context 'with a logged-in user' do
      it 'saves the poem'
      it "adds to the user's word count"
      context 'with invalid poem attributes' do
        it 'returns error response'
      end
    end

    context 'with no user logged in' do
      it 'redirects the user to Twitter log-in'
    end
  end

  describe 'DELETE #destroy' do
    it 'removes the poem from the database'
    it "redirects to the user's profile page"
  end

end
