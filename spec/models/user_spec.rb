require 'spec_helper'

describe User do

  it 'has a valid factory' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'is invalid without a twitter handle' do
    user = build(:user, twitter_handle: nil)
    expect(user).to have(1).errors_on(:twitter_handle)
  end

  it 'initializes with word_count of 0' do
    user = build(:user)
    expect(user.word_count).to eq 0
  end

  it 'adds to word count' do
    user = create(:user, word_count: 0)
    user.add_to_word_count(9)
    expect(user.word_count).to eq 9
  end

  it 'does not subtract from word count' do
    user = create(:user, word_count: 2)
    user.add_to_word_count(-1)
    expect(user.word_count).to eq 2
  end

end