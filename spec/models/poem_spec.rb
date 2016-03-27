require 'spec_helper'

describe Poem do

  it 'has a valid factory' do
    poem = build(:poem)
    expect(poem).to be_valid
  end

  it 'is invalid without a user' do
    poem = build(:poem, user: nil)
    poem.valid?
    expect(poem.errors[:user].size).to eq 1
  end

  it 'is invalid without a source user' do
    poem = build(:poem, source_user: nil)
    poem.valid?
    expect(poem.errors[:source_user].size).to eq 1
  end

  it 'is invalid without text' do
    poem = build(:poem, text: nil)
    poem.valid?
    expect(poem.errors[:text].size).to eq 1
  end

  it 'is invalid with text of length 0' do
    poem = build(:poem, text: '')
    poem.valid?
    expect(poem.errors[:text].size).to eq 1
  end

  it 'is invalid with text of length >140' do
    pending 'Not sure I like this restriction'
    poem = build(:poem, text: Faker::Lorem.characters(141))
    expect(poem).to have(1).errors_on(:text)
  end

  it "adds to user's word count after save" do
    poem = create(:poem, text: 'here is some text')
    expect(poem.user.word_count).to eq 4
  end

end
