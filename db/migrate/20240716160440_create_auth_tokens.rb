class CreateAuthTokens < ActiveRecord::Migration[7.1]
  def change
    create_table :auth_tokens do |t|
      t.references :user, null: false, index: true
      t.string :token, null: false
      t.datetime :expires_at, null: false
      
      t.timestamps
    end
  end
end
