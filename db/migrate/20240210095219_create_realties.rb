class CreateRealties < ActiveRecord::Migration[7.1]
  def change
    create_enum :status, ["apartment", "house", "country_house", "cottage"]

    create_table :realties do |t|
      t.integer :organization_id, null: false, index: true
      t.integer :building_year, null: false
      t.integer :floor, null: false
      t.text :description, null: false
      t.integer :area, null: false
      t.integer :entrance, null: true
      t.integer :rooms_count, null: false
      t.enum :realty_type, enum_type: "status", default: "apartment", null: false
      t.float :base_price, null: false
      t.float :lon , null: false
      t.float :lat, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
