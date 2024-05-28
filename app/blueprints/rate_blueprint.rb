class RateBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :extra_change, :extra_change_type

  view :with_realties do
    association :realties, blueprint: RealtyBlueprint, default: []
  end
end
