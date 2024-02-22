# frozen_string_literal: true

class CreateRealties < ActiveRecord::Migration[7.1]
  def change
    create_table :realties do |t|
      t.references :organization, null: false, index: true
      t.integer :building_year, null: false
      t.integer :floor, null: false
      t.text :description, null: false
      t.integer :area, null: false
      t.integer :entrance, null: true
      t.integer :rooms_count, null: false
      t.string :realty_type, null: false
      t.float :base_price, null: false
      t.float :lon, null: false
      t.float :lat, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
