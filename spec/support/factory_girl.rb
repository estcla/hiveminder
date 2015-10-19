require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :hive do
    name "Hivey Hive"
    location "Backyard"
    established "Two seconds ago"
    health "Good"
  end

  factory :inspection do
    date "Yesterday"
    time_of_day { Faker::Name.name }
  end
end
