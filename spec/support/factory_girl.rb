require 'factory_girl'

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
    user_id 1
  end
end
