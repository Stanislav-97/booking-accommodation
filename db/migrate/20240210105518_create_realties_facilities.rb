class CreateRealtiesFacilities < ActiveRecord::Migration[7.1]
  def change
    create_table :realties_facilities do |t|
      t.references :realty, null: false, index: true
	    t.references :facility, null: false, index: true

      t.timestamps
    end
  end
end
