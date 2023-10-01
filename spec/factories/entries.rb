FactoryBot.define do
  factory :entry do
    association :user, factory: :user
    association :room, factory: :room
  end
end