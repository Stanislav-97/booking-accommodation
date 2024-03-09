class RealtyBlueprint < Blueprinter::Base
  identifier :id

  fields :building_year, :floor, :description, :area,
         :entrance, :rooms_count, :realty_type, :base_price, :lon, :lat, :address

  view :with_bookings do 
    association :bookings, blueprint: BookingBlueprint, default: []
  end
end
