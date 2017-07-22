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

ActiveRecord::Schema.define(version: 20170714175000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                limit: 128,                 null: false
    t.string   "email",                                           null: false
    t.string   "age",                 limit: 128
    t.date     "birth_date"
    t.integer  "gender",                          default: 0
    t.string   "phone_number"
    t.boolean  "email_verified",                  default: false
    t.boolean  "phone_verified",                  default: false
    t.string   "encrypted_password",  limit: 128,                 null: false
    t.string   "confirmation_token",  limit: 128
    t.string   "remember_token",      limit: 128,                 null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

end
