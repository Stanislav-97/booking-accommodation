# frozen_string_literal: true

FactoryBot.define do
  factory :rate do
    organization

    name { Faker::Name.name }
    extra_change { Faker::Number.between(from: 50, to: 100) }
    extra_change_type { Faker::PhoneNumber.cell_phone }
  end
end
