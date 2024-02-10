class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.integer :realty_id, null: false, index: true
	    t.date :date_from, null: false
	    t.date :date_to, null: false
	    t.float :amount, null: false
	    t.float :paid_amount, null: false
	    t.string :fio, null: false 
	    t.string :phone, null: false 
	    t.string :email, null: false 

      t.timestamps
    end
  end
end
