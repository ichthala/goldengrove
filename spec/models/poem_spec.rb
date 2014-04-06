require 'spec_helper'

describe Poem do

  it 'has a valid factory' do
    poem = build(:poem)
    expect(poem).to be_valid
  end

  it 'is invalid without a user' do
    poem = build(:poem, user: nil)
    expect(poem).to have(1).errors_on(:user)
  end

  it 'is invalid without a source user' do
    poem = build(:poem, source_user: nil)
    expect(poem).to have(1).errors_on(:source_user)
  end

  it 'is invalid without text' do
    poem = build(:poem, text: nil)
    expect(poem).to have(1).errors_on(:text)
  end

  it 'is invalid with text of length 0' do
    poem = build(:poem, text: '')
    expect(poem).to have(1).errors_on(:text)
  end

  it 'is invalid with text of length >140' do
    poem = build(:poem, text: Faker::Lorem.characters(141))
    expect(poem).to have(1).errors_on(:text)
  end

end