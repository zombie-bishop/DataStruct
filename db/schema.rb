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

ActiveRecord::Schema.define(version: 20180322144632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_props", force: :cascade do |t|
    t.integer  "data_struct_id"
    t.text     "property"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["data_struct_id"], name: "index_data_props_on_data_struct_id", using: :btree
  end

  create_table "data_structs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "parent"
    t.string   "name", default: "Data Structure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_data_structs_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "data_props", "data_structs"
  add_foreign_key "data_structs", "users"
end
