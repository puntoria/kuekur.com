class AddCategoryToEvent < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :category, foreign_key: true, index: true
  end
end
