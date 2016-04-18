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

ActiveRecord::Schema.define(version: 20160416083329) do

  create_table "flea_markets", force: :cascade do |t|
    t.integer  "is_visible",  limit: 4,   default: 0
    t.string   "market_name", limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "location",    limit: 255
    t.string   "memo",        limit: 255
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "list_image",  limit: 191
    t.string   "top_image",   limit: 191
    t.integer  "view_count",  limit: 4,   default: 0
  end

  create_table "fleamarket_images", force: :cascade do |t|
    t.integer  "is_visible",     limit: 4,   default: 1
    t.integer  "flea_market_id", limit: 4
    t.string   "image",          limit: 255
    t.integer  "image_type",     limit: 4,   default: 0
    t.integer  "sort",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fleamarket_tags", force: :cascade do |t|
    t.integer  "is_visible",     limit: 4,   default: 1
    t.integer  "flea_market_id", limit: 4
    t.string   "tag_name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 191, default: "", null: false
    t.string   "encrypted_password",     limit: 191, default: "", null: false
    t.string   "reset_password_token",   limit: 191
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 191
    t.string   "last_sign_in_ip",        limit: 191
    t.string   "confirmation_token",     limit: 191
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 191
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end