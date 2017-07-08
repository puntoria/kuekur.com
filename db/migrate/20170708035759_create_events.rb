class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title, null: false, default: "", limit: 255
      t.string :description, limit: 255
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.boolean :shareable, default: true
      t.boolean :show_remaining, default: true
      t.boolean :listed, default: true
      t.integer :capacity
      t.string :source

      t.timestamps
    end
  end
end
