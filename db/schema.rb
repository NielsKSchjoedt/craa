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

ActiveRecord::Schema.define(version: 20150523094808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drivers", force: :cascade do |t|
    t.text     "full_name"
    t.string   "country"
    t.integer  "race_car_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
  end

  add_index "drivers", ["race_car_id"], name: "index_drivers_on_race_car_id", using: :btree

  create_table "race_cars", force: :cascade do |t|
    t.integer  "start_no"
    t.string   "class_type"
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.integer  "ccm"
    t.integer  "hp"
    t.integer  "votes",                                        default: 0
    t.text     "description"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.decimal  "acceleration",         precision: 8, scale: 1
  end

  add_index "race_cars", ["class_type", "start_no"], name: "index_race_cars_on_class_type_and_start_no", unique: true, using: :btree

  add_foreign_key "drivers", "race_cars"
end
