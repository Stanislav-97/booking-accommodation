class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.integer :organization_id, null: false, index: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.boolean :organization_admin, null: false
      t.string :email, null: true
      t.string :phone, null: false

      t.timestamps
    end
  end
end
