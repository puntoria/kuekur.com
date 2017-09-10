class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.references :bookmarkee, polymorphic: true
      t.references :bookmarker, polymorphic: true
      t.timestamps null: false
    end

    add_index :bookmarks, [:bookmarkee_id, :bookmarkee_type], name: "bookmarks_bookmarkee_idx"
    add_index :bookmarks, [:bookmarker_id, :bookmarker_type], name: "bookmarks_bookmarker_idx"
    add_index :bookmarks, [:bookmarkee_id, :bookmarkee_type, :bookmarker_id, :bookmarker_type], name: "bookmarks_bookmarkee_bookmarker_idx", unique: true
  end
end

