FactoryBot.define do
  factory :bookmark do
    association :user, factory: :user
    association :plant, factory: :plant
  end
end