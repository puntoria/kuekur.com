class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :meta_title
      t.string :short_name
      t.string :long_name

      t.timestamps
    end
  end
end
