FactoryBot.define do
  factory :facility do
    name { Faker::Name.first_name }
    icon { Faker::Avatar.image }
  end
end
