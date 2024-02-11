FactoryBot.define do
  factory :user do
    organization

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    organization_admin { false }

    trait :admin do
      organization_admin { true }
    end
  end
end
