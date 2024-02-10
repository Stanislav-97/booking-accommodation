class CreateUsersRealties < ActiveRecord::Migration[7.1]
  def change
    create_table :users_realties do |t|
      t.integer :user_id, null: false, index: true
	    t.integer :realty_id, null: false, index: true

      t.timestamps
    end
  end
end
