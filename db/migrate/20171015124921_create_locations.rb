class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :address, null: false
      t.string :city, null: false
      t.string :country, null: false
      t.decimal :latitude, null: false, precision: 15, scale: 10
      t.decimal :longitude, null: false, precision: 15, scale: 10

      t.references :locatable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
