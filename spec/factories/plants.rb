FactoryBot.define do
  factory :plant do
    name { Faker::Lorem.characters(number: rand(1..10)) }
    description { Faker::Lorem.characters(number: rand(1..500)) }
    start_date { Time.at(rand * Time.now.to_i) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/botalog-background.jpeg'), filename: 'botalog-background.jpeg')
    end
  end
end