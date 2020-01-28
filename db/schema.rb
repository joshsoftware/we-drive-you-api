# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_28_093854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabs", force: :cascade do |t|
    t.integer "cab_capacity"
    t.string "Vehicle_number"
    t.integer "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_number"
    t.string "licence_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "slug"
  end

  create_table "rides", force: :cascade do |t|
    t.time "time"
    t.text "routes", default: [], array: true
    t.bigint "cab_id"
    t.integer "available_seats"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cab_id"], name: "index_rides_on_cab_id"
  end

end
