require 'faker'

FactoryGirl.define do
  factory :poem do |f|
    association :user
    f.source_user { Faker::Internet.user_name }
    f.text { Faker::Lorem.characters(140) }
  end
end
