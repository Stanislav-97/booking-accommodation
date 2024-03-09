# frozen_string_literal: true

class CreateRealtiesPhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :realties_photos do |t|
      t.references :realty, null: false, index: true
      t.string :photo, null: false

      t.timestamps
    end
  end
end
