# frozen_string_literal: true

class CreateRates < ActiveRecord::Migration[7.1]
  def change
    create_table :rates do |t|
      t.references :organization, null: false, index: true
      t.string :name, null: false
      t.float :extra_charge, null: false
      t.string :extra_charge_type, null: false

      t.timestamps
    end
  end
end
