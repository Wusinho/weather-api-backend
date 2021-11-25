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

ActiveRecord::Schema.define(version: 2021_11_25_022339) do

  create_table "locations", force: :cascade do |t|
    t.float "lat"
    t.float "lon"
    t.string "city"
    t.string "state"
    t.integer "weather_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["weather_id"], name: "index_locations_on_weather_id"
  end

  create_table "temperatures", force: :cascade do |t|
    t.integer "weather_id", null: false
    t.float "temperature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["weather_id"], name: "index_temperatures_on_weather_id"
  end

  create_table "weathers", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "weather_index"
  end

  add_foreign_key "locations", "weathers"
  add_foreign_key "temperatures", "weathers"
end
