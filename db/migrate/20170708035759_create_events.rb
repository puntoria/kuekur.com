class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title, null: false, default: "", limit: 255
      t.string :description, null: false, limit: 255
      t.string :url, null: false, default: ""
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.datetime :created, null: false
      t.datetime :updated, null: false
      t.boolean :shareable, default: true
      t.boolean :show_remaining, default: true
      t.boolean :listed, default: true
      t.boolean :invite_only, default: false
      t.integer :status, null: false
      t.integer :capacity
      t.string :source

      t.timestamps
    end
  end
end
