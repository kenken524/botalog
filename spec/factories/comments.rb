FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.characters(number: rand(1..150)) }
    association :user

    trait :with_plant do
      association :commentable, factory: :plant
    end

    trait :with_care_record do
      association :commentable, factory: :care_record
    end

  end
end