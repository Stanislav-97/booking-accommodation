# frozen_string_literal: true

class RealtyBlueprint < Blueprinter::Base
  identifier :id

  fields :building_year, :floor, :description, :area,
         :entrance, :rooms_count, :realty_type, :base_price, :lon, :lat, :address
  association :bookings, blueprint: BookingBlueprint
end

class BookingBlueprint < Blueprinter::Base
  identifier :id

  fields :date_from, :date_to, :amount, :paid_amount, :fio, :phone, :email
end
