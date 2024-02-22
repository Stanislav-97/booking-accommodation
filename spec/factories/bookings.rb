# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    realty

    amount { Faker::Number.between(from: 100, to: 500) }
    date_from { Date.current }
    date_to { Date.tomorrow }
    paid_amount { amount - [Faker::Number.between(from: 100, to: 500), amount].min }
    fio { Faker::Name.name }
    phone { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
  end
end
