require 'spec_helper'

describe 'poems', driver: :selenium do
  it 'displays poem creation' do
    visit '/poems/new'
    expect(page).to have_content 'Time to create'
  end
end
