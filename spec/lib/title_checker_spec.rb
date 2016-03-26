require 'title_checker'
require 'spec_helper'

describe TitleChecker do
  let(:user) { create(:user) }
  let(:poem) { create(:poem, user: user) }
  let(:tc) { TitleChecker.new(user: user, poem: poem) }

  # xxx add unhappy tests
  context 'under expected conditions gives title' do

    it 'Apprenctice Wordsmith' do
      expect(tc.apprentice_wordsmith).to be_truthy
    end

    it 'Lord Tennyson' do
      10.times do
        create(:poem, user: user)
      end
      expect(tc.lord_tennyson).to be_truthy
    end

    it 'Let Us Go' do
      poem.text = 'not much here'
      expect(tc.let_us_go).to be_truthy
    end

    it 'Wordsworthy' do
      user.word_count = 100
      expect(tc.wordsworthy).to be_truthy
    end

    it 'Tweet Brigade' do
      user.word_count = 600
      expect(tc.tweet_brigade).to be_truthy
    end

    it 'Byronic Hero' do
      poem.text = 'stormy moors'
      expect(tc.byronic_hero).to be_truthy
    end

    it 'Poe-Trie' do
      poem.text = 'Once upon a Midnight DrEaRy'
      expect(tc.poe_trie).to be_truthy
    end

    it 'Lovecraftian' do
      poem.text = 'hail to Cthulhu'
      expect(tc.lovecraftian).to be_truthy
    end

    it 'Duke of Repartee' do
      user_you_replied_to = create(:user, twitter_handle: poem.source_user)
      poem_you_replied_to = create(:poem,
                                    user: user_you_replied_to,
                                    source_user: user.twitter_handle)

      poem.source_user = user_you_replied_to.twitter_handle
      expect(tc.duke_of_repartee).to be_truthy
    end

    it 'Rake Progressing' do
      poem.text = 'Shite, I gotta get me out o Liverpool'
      expect(tc.rake_progressing).to be_truthy
    end

  end

end
