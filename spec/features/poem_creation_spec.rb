require 'spec_helper'

describe 'Poem creation flow:', driver: :selenium do

  context 'When a user visits the poem creation page' do
    it 'displays three random Twitter users' do
      visit '/poems/new'
      expect(page).to have_content 'Time to create'
    end

    context 'and the user clicks on a random Twitter user' do
      it "shows the selected user's tweets" do
      end
    end

    context 'and the user searches for a specific Twitter user' do
      it "shows the selected user's tweets" do
      end
    end
  end

  context 'When a user has written a poem' do
    context 'and the user is not signed in' do
      it 'shows the "Sign in" modal' do
      end

      context 'When the user opts to sign in' do
        it 'saves the previously written poem' do
        end

        it 'shows the "You Posted" view' do
        end
      end
    end

    context 'and the user is signed in' do
      it 'saves the poem' do
      end

      it 'shows the "You Posted" view' do
      end
    end
  end

end
