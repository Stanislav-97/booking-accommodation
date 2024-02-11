FactoryBot.define do
  factory :price do
    realty

    amount { Faker::Number.between(from: 100, to: 500) }
    date { Date.current }
  end
end
