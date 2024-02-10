class CreateRealtiesPhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :realties_photos do |t|
      t.integer :realty_id, null: false, index: true
      t.blob :photo, null: false

      t.timestamps
    end
  end
end
