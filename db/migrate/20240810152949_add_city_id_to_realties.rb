class AddCityIdToRealties < ActiveRecord::Migration[7.1]
  def change
    add_column :realties, :city_id, :integer
  end
end
