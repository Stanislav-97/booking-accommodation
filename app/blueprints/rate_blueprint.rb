class RateBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :extra_charge, :extra_charge_type

  view :with_realties do
    association :realties, blueprint: RealtyBlueprint, default: []
  end
end
