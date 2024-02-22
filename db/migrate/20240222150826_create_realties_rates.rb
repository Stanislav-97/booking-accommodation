# frozen_string_literal: true

class CreateRealtiesRates < ActiveRecord::Migration[7.1]
  def change
    create_table :realties_rates do |t|
      t.references :realty, null: false, index: true
      t.references :rate, null: false, index: true

      t.timestamps
    end
  end
end
