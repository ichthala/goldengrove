require 'spec_helper'

describe PoemsController do

  describe "GET #index" do
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

  describe "GET #show" do
    it "returns the poem with the given ID" do
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

  describe "GET #new" do
    it "assigns a new poem to @poem" do
      get :new
      expect(assigns(:poem)).to be_a_new(Poem)
    end

    it "renders the new poem view"
      get :new
      expect(:response).to render_template :new
    end
  end

  describe "GET #select_user" do
    it "populates an array of 10 random users"
  end

  describe "POST #write_poem" do
    it "populates an array of source user's last 30 tweets"
  end

  describe "POST #create" do
    context "with a logged-in user" do
      context "with valid attributes" do
        it "saves the poem to the database"
        it "shares the poem to Twitter"
      end

      context "with invalid attributes" do
        it "does not save the poem to the database"
        it "does not share to Twitter"
      end
    end

    context "with no user logged in" do
      it "redirects the user to Twitter log-in"
    end
  end

  describe "DELETE #destroy" do
    it "removes the poem from the database"
    it "redirects to the user's profile page"
  end

end
