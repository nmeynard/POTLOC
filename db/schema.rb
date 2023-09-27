# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_27_003601) do
  create_table "shoe_models", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shoe_stores", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ws_events", force: :cascade do |t|
    t.integer "shoe_store_id", null: false
    t.integer "shoe_model_id", null: false
    t.integer "qty_left"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shoe_model_id"], name: "index_ws_events_on_shoe_model_id"
    t.index ["shoe_store_id"], name: "index_ws_events_on_shoe_store_id"
  end

  add_foreign_key "ws_events", "shoe_models"
  add_foreign_key "ws_events", "shoe_stores"
end
