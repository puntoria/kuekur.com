class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""
      t.belongs_to :section, index: true

      t.timestamps
    end
  end
end
