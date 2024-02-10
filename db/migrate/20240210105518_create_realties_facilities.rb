class CreateRealtiesFacilities < ActiveRecord::Migration[7.1]
  def change
    create_table :realties_facilities do |t|
      t.integer :realty_id, null: false, index: true
	    t.integer :facility_id, null: false, index: true

      t.timestamps
    end
  end
end
