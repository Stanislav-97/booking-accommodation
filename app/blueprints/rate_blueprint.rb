class RateBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :date_to, :extra_change, :extra_change_type

  view :with_realties do
    association :realties, blueprint: RealtyBlueprint, default: []
  end
end