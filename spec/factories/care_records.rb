FactoryBot.define do
  factory :care_record do
    description { Faker::Lorem.characters(number: rand(1..500)) }
    care_date { Time.at(rand * Time.now.to_i) }
    
    association :user
    association :plant

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/botalog-background.jpeg'), filename: 'botalog-background.jpeg')
    end
  end
end
