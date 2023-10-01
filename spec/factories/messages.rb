FactoryBot.define do
  factory :message do
    association :user, factory: :user
    association :room, factory: :room
    body { Faker::Lorem.characters(number: rand(1..200)) }
  end
end