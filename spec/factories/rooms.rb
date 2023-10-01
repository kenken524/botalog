FactoryBot.define do
  factory :room do
    association :user1, factory: :user
    association :user2, factory: :user

    after(:create) do |room|
      create_list(:message, 5, room: room)
    end
  end
end