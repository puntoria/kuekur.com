# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170930200504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.string   "bookmarkee_type"
    t.integer  "bookmarkee_id"
    t.string   "bookmarker_type"
    t.integer  "bookmarker_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["bookmarkee_id", "bookmarkee_type", "bookmarker_id", "bookmarker_type"], name: "bookmarks_bookmarkee_bookmarker_idx", unique: true, using: :btree
    t.index ["bookmarkee_id", "bookmarkee_type"], name: "bookmarks_bookmarkee_idx", using: :btree
    t.index ["bookmarkee_type", "bookmarkee_id"], name: "index_bookmarks_on_bookmarkee_type_and_bookmarkee_id", using: :btree
    t.index ["bookmarker_id", "bookmarker_type"], name: "bookmarks_bookmarker_idx", using: :btree
    t.index ["bookmarker_type", "bookmarker_id"], name: "index_bookmarks_on_bookmarker_type_and_bookmarker_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",          limit: 255, default: "",    null: false
    t.string   "description",    limit: 255,                 null: false
    t.string   "url",                        default: "",    null: false
    t.datetime "start_date",                                 null: false
    t.datetime "end_date",                                   null: false
    t.datetime "created",                                    null: false
    t.datetime "updated",                                    null: false
    t.boolean  "shareable",                  default: true
    t.boolean  "show_remaining",             default: true
    t.boolean  "listed",                     default: true
    t.boolean  "invite_only",                default: false
    t.integer  "status",                                     null: false
    t.integer  "capacity"
    t.string   "source"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                limit: 128,                 null: false
    t.string   "email",                                           null: false
    t.integer  "age"
    t.date     "birth_date"
    t.integer  "gender",                          default: 0
    t.string   "website",             limit: 128
    t.text     "bio"
    t.string   "phone_number",        limit: 128
    t.boolean  "email_verified",                  default: false
    t.boolean  "phone_verified",                  default: false
    t.string   "encrypted_password",  limit: 128,                 null: false
    t.string   "confirmation_token",  limit: 128
    t.string   "remember_token",      limit: 128,                 null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "admin",                           default: false, null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "events", "users"
end
