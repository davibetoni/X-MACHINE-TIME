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

ActiveRecord::Schema.define(version: 2020_12_16_151759) do

  create_table "events", force: :cascade do |t|
    t.string "event_name"
    t.string "event_date"
    t.string "contact_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "filees", force: :cascade do |t|
    t.integer "position"
    t.string "compression"
    t.string "type"
    t.string "name"
    t.integer "length"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "infos", force: :cascade do |t|
    t.integer "machine_id"
    t.integer "video_sequence"
    t.string "file_compression"
    t.string "file_type"
    t.string "file_name"
    t.integer "video_length"
    t.string "status"
    t.string "event_name"
    t.string "event_date"
    t.string "contact_name"
    t.integer "event_id", null: false
    t.integer "filee_id", null: false
    t.integer "maachine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_infos_on_event_id"
    t.index ["filee_id"], name: "index_infos_on_filee_id"
    t.index ["maachine_id"], name: "index_infos_on_maachine_id"
  end

  create_table "maachines", force: :cascade do |t|
    t.integer "maachine_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "infos", "events"
  add_foreign_key "infos", "filees"
  add_foreign_key "infos", "maachines"
end
