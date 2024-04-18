class PriceBlueprint < Blueprinter::Base
  identifier :id

  fields :amount, :date_from, :date_to
end
