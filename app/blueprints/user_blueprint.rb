class UserBlueprint < Blueprinter::Base
  identifier :id

  fields :first_name, :last_name, :email, :phone, :organization_admin

  view :with_realties do
    association :realties, blueprint: RealtyBlueprint, default: []
  end
end
