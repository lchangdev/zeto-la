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

ActiveRecord::Schema.define(version: 20140716215756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contact_requests", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
  end

  create_table "members", force: true do |t|
    t.integer "post_id", null: false
    t.integer "user_id", null: false
  end

  add_index "members", ["post_id", "user_id"], name: "index_members_on_post_id_and_user_id", unique: true, using: :btree

  create_table "posts", force: true do |t|
    t.string   "title",       limit: 60, null: false
    t.text     "description",            null: false
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "date",                   null: false
    t.time     "time"
    t.integer  "user_id",                null: false
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider",                                                                         null: false
    t.string   "uid",                                                                              null: false
    t.string   "name",                                                                             null: false
    t.string   "image",                                                                            null: false
    t.string   "email",                                                                            null: false
    t.string   "oauth_token",                                                                      null: false
    t.datetime "oauth_expires_at",                                                                 null: false
    t.string   "address",                      default: "33 Harrison Ave. #501, Boston MA. 02111"
    t.float    "latitude",                     default: 42.3516303
    t.float    "longitude",                    default: -71.0614178
    t.string   "cohort"
    t.string   "company_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "confirmation",                 default: true
    t.string   "tagline",          limit: 160
    t.string   "twitter"
    t.string   "github"
  end

  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
