require 'spec_helper'

describe PoemsController do

  describe "GET #index" do
    it "populates an array of poems" do
      poem = FactoryGirl.create(:poem)
      get :index
      assigns(:poems).should eq([poem])
    end

    it "renders the index (Salon) view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "returns the poem with the given ID" do
      poem = FactoryGirl.create(:poem)
      get :show, id: poem
      assigns(:poem).should eq(poem)
    end

    it "renders the show view" do
      get :show, id: FactoryGirl.create(:contact)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "renders the new poem view"
  end

  describe "GET #select_user" do
    it "populates an array of 9 random users + horse_ebooks"
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



  describe "title checks" do
    describe "title_first_post" do
    end

    describe "title_tennyson" do
    end
  end

end