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

ActiveRecord::Schema.define(version: 20140823173323) do

  create_table "badges", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "icon"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "badges_users", id: false, force: true do |t|
    t.integer "user_id",  null: false
    t.integer "badge_id", null: false
  end

  create_table "bookings", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "length"
    t.integer  "ong_id"
  end

  add_index "bookings", ["ong_id"], name: "index_bookings_on_ong_id"

  create_table "bookings_users", id: false, force: true do |t|
    t.integer "user_id",    null: false
    t.integer "booking_id", null: false
  end

  create_table "challenges", force: true do |t|
    t.integer  "ong_id"
    t.integer  "objective"
    t.integer  "progress"
    t.boolean  "active"
    t.date     "start"
    t.date     "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "challenges", ["ong_id"], name: "index_challenges_on_ong_id"

  create_table "ongs", force: true do |t|
    t.string   "name"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "zip"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "national_network"
    t.string   "international_network"
    t.string   "comments"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "ourmark_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ongs_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "ong_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "birth"
    t.integer  "dni"
    t.string   "bloodtype"
    t.string   "gender"
    t.string   "city"
    t.string   "state"
    t.string   "country"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
