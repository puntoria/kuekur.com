class AddExtraFieldsToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :long_name, :string
    add_column :locations, :short_name, :string
    add_column :locations, :types, :string
    add_column :locations, :formatted_address, :string
    add_column :locations, :location_type, :string
    add_column :locations, :place_id, :string
  end
end
