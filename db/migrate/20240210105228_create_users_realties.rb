class CreateUsersRealties < ActiveRecord::Migration[7.1]
  def change
    create_table :users_realties do |t|
      t.references :user, null: false, index: true
	    t.references :realty, null: false, index: true

      t.timestamps
    end
  end
end
