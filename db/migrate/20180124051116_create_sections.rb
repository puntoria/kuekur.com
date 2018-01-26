class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :title, null: false, default: ""
      t.references :contents, index: true

      t.timestamps
    end
  end
end
