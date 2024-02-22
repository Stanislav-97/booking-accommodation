# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
  identifier :id

  fields :first_name, :last_name, :email, :phone, :organization_admin
  association :realties, blueprint: RealtyBlueprint
end

class RealtyBlueprint < Blueprinter::Base
  identifier :id

  fields :building_year, :floor, :description, :area,
         :entrance, :rooms_count, :realty_type, :base_price, :lon, :lat, :address
end
