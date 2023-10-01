FactoryBot.define do
  factory :user do
    nickname { Faker::Lorem.characters(number: rand(1..12)) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6, max_length: Devise.password_length.max) }
    password_confirmation { password }
    profile { Faker::Lorem.characters(number: rand(1..100)) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/botalog-background.jpeg'), filename: 'botalog-background.jpeg')
    end
  end
end