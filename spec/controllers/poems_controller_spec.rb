require 'spec_helper'

describe PoemsController do

  describe 'GET #index' do
    it "populates an array of poems" do
      poem = create(:poem)
      get :index
      expect(assigns(:poems)).to match_array([poem])
    end

    it "returns the 30 most recent poems"

    it "renders the index (Salon) view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "assigns the requested poem to @poem" do
      poem = create(:poem)
      get :show, id: poem
      expect(assigns(:poem)).to eq(poem)
    end

    it "renders the show view" do
      poem = create(:poem)
      get :show, id: poem
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "renders the new poem view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #random_users' do
    it "populates an array of 9 random users + horse_ebooks"
  end

  describe 'POST #create' do
    context "with a logged-in user" do
      it "saves the poem"
      it "adds to the user's word count"
      context "with invalid poem attributes" do
        it "returns error response"
      end
    end

    context "with no user logged in" do
      it "redirects the user to Twitter log-in"
    end
  end

  describe 'DELETE #destroy' do
    it "removes the poem from the database"
    it "redirects to the user's profile page"
  end

end
