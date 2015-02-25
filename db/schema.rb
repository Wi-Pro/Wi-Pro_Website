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

ActiveRecord::Schema.define(version: 20150225183429) do

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

  create_table "posts", force: true do |t|
    t.string   "server"
    t.string   "hexfile_file_name"
    t.string   "hexfile_content_type"
    t.integer  "hexfile_file_size"
    t.datetime "hexfile_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wiproids", force: true do |t|
    t.string   "name"
    t.integer  "wiproid"
    t.integer  "userid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wipros", force: true do |t|
    t.string "wpid"
    t.text   "wpname"
  end

end
