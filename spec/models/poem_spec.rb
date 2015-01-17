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
    pending 'Not sure I like this restriction'
    poem = build(:poem, text: Faker::Lorem.characters(141))
    expect(poem).to have(1).errors_on(:text)
  end

  it "adds to user's word count after save" do
    poem = create(:poem, text: 'here is some text')
    expect(poem.user.word_count).to eq 4
  end

  describe '#as_json' do
    it 'outputs created_at_str in correct format' do
      Timecop.freeze(Time.local(2014, 5, 4, 5, 5, 0))
      poem = create(:poem)
      expect(poem.as_json["created_at_str"]).to eq("May 4, 2014, 9:05 am")
    end
  end

  describe '#serializable_hash' do
    it 'outputs created_at in correct format' do
      Timecop.freeze(Time.local(2014, 5, 4, 5, 5, 0))
      poem = create(:poem)
      expect(poem.serializable_hash["created_at_str"]).to eq("May 4, 2014, 9:05 am")
    end
  end

end