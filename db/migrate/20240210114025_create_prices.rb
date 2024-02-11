class CreatePrices < ActiveRecord::Migration[7.1]
  def change
    create_table :prices do |t|
      t.float :amount, null: false
	    t.date :date, null: false
	    t.references :realty, null: false, index: true

      t.timestamps
    end
  end
end
