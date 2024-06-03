FactoryBot.define do
  factory :rate do
    organization

    name { Faker::Name.name }
    extra_charge { Faker::Number.between(from: 50, to: 100) }
    extra_charge_type { Faker::PhoneNumber.cell_phone }
  end
end
