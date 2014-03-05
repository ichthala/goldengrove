require 'spec_helper'

describe Poem do

  let(:user) { User.create }

  it 'is valid with a user, source user, and text' do
    poem = Poem.new(
      source_user: 'ichthala',
      text: 'hello'
    )
    poem.user = user
    expect(poem).to be_valid
  end

  it 'is invalid without a user' do
    poem = Poem.new(
      source_user: 'ichthala',
      text: 'hello'
    )
    poem.user = nil
    expect(poem).to have(1).errors_on(:user)
  end

  it 'is invalid without a source user' do
    poem = Poem.new(
      source_user: nil,
      text: 'hello'
    )
    poem.user = user
    expect(poem).to have(1).errors_on(:source_user)
  end

  it 'is invalid without text' do
    poem = Poem.new(
      source_user: 'ichthala',
      text: nil
    )
    poem.user = user
    expect(poem).to have(1).errors_on(:text)
  end

  it 'is invalid with text of length 0' do
    poem = Poem.new(
      source_user: 'ichthala',
      text: ''
    )
    poem.user = user
    expect(poem).to have(1).errors_on(:text)
  end

end