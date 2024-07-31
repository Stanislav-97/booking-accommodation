FactoryBot.define do
  factory :auth_token do
    user

    token { Faker::String.random(length: 30) }
    expires_at { Faker::Date.between(from: "2024-08-01", to: "2024-08-4") }
  end
end
