# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140705164744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contact_requests", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
  end

  create_table "users", force: true do |t|
    t.string   "provider",         null: false
    t.string   "uid",              null: false
    t.string   "name",             null: false
    t.string   "image",            null: false
    t.string   "email",            null: false
    t.string   "oauth_token",      null: false
    t.datetime "oauth_expires_at", null: false
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "cohort"
    t.string   "company_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
