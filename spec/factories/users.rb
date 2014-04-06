require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.twitter_handle { Faker::Internet.user_name }
  end
end
