FactoryBot.define do
  factory :realty do
    organization

    building_year { Faker::Number.between(from: 2000, to: 2024) }
    description { Faker::String.random }
    floor { Faker::Number.between(from: 1, to: 10) }
    area { Faker::Number.number(digits: 2) }
    rooms_count { Faker::Number.between(from: 1, to: 4) }
    entrance { Faker::Number.between(from: 1, to: 3) }
    realty_type { "flat" }

    base_price { Faker::Number.between(from: 2000, to: 10_000) }
    lon { Faker::Address.longitude }
    lat { Faker::Address.latitude }
    address { Faker::Address.street_address }

    Realty.realty_types.each_key do |realty_type|
      trait realty_type do
        realty_type { realty_type }
      end
    end
  end
end
