FactoryBot.define do
  factory :realties_photo do
    realty

    photo { Faker::Avatar.image }
  end
end
