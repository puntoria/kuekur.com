class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true, index: true
      t.references :event, polymorphic: true, index: true

      t.timestamps
    end
  end
end
