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

ActiveRecord::Schema.define(version: 2020_02_10_101018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabs", force: :cascade do |t|
    t.string "vehicle_number"
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hops", force: :cascade do |t|
    t.string "location"
    t.integer "credit"
    t.integer "sequence_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "ride_id"
    t.index ["ride_id"], name: "index_hops_on_ride_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "slug"
  end

  create_table "ride_requests", force: :cascade do |t|
    t.string "location"
    t.string "scheduled_type"
    t.bigint "user_id"
    t.bigint "ride_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ride_id"], name: "index_ride_requests_on_ride_id"
    t.index ["user_id"], name: "index_ride_requests_on_user_id"
  end

  create_table "rides", force: :cascade do |t|
    t.time "time"
    t.bigint "cab_id"
    t.integer "available_seats"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cab_id"], name: "index_rides_on_cab_id"
  end

end
