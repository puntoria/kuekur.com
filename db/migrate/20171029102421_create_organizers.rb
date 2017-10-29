class CreateOrganizers < ActiveRecord::Migration[5.0]
  def change
    create_table :organizers do |t|
      t.string :name, null: false
      t.text :description
      t.text :long_description
      t.attachment :logo
      t.string :website
      t.string :twitter
      t.string :facebook
      t.string :instagram

      t.belongs_to :event, index: true, foreign_key: true

      t.timestamps
    end
  end
end
