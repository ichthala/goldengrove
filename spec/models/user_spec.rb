require 'spec_helper'

describe User do

  it 'is valid with a twitter handle' do
    user = User.new(twitter_handle: 'ichthala')
    expect(user).to be_valid
  end

  it 'is invalid without a twitter handle' do
    user = User.new(twitter_handle: nil)
    expect(user).to have(1).errors_on(:twitter_handle)
  end

  it 'adds words to its word count'

end