class ChangeNullableOfOrganizationIdInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :organization_id, true
  end
end
