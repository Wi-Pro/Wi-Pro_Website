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

ActiveRecord::Schema.define(version: 20150412063107) do

  create_table "administrators", force: true do |t|
    t.integer  "userid"
    t.integer  "groupid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checkouts", force: true do |t|
    t.integer  "userid"
    t.integer  "wiproid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devicepreferences", force: true do |t|
    t.integer  "deviceid"
    t.integer  "userid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "name"
    t.string   "signature"
    t.integer  "flash_size"
    t.integer  "pin_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hex_files", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hexes", force: true do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "wiproid"
    t.integer  "deviceid"
  end

  create_table "memberships", force: true do |t|
    t.integer  "groupid"
    t.integer  "userid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "server"
    t.string   "hexfile_file_name"
    t.string   "hexfile_content_type"
    t.integer  "hexfile_file_size"
    t.datetime "hexfile_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ssids", force: true do |t|
    t.integer  "wiproid"
    t.string   "ssid"
    t.boolean  "connected"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "devicepreference"
    t.integer  "checkoutid"
    t.boolean  "admin"
  end

  create_table "wiproavails", force: true do |t|
    t.integer  "wiproid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wiproids", force: true do |t|
    t.string   "name"
    t.integer  "wiproid"
    t.integer  "userid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "wiprouser"
    t.integer  "checkedoutby"
    t.integer  "groupid"
  end

  create_table "wipros", force: true do |t|
    t.string "wpid"
    t.text   "wpname"
  end

end
