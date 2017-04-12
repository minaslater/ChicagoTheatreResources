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

ActiveRecord::Schema.define(version: 20170411043643) do

  create_table "interpreters", force: :cascade do |t|
    t.string   "first_name",                        null: false
    t.string   "last_name",                         null: false
    t.string   "accreditation",                     null: false
    t.boolean  "rehearsal_avail",   default: false
    t.boolean  "performance_avail", default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["first_name"], name: "index_interpreters_on_first_name"
    t.index ["last_name"], name: "index_interpreters_on_last_name"
    t.index ["performance_avail"], name: "index_interpreters_on_performance_avail"
    t.index ["rehearsal_avail"], name: "index_interpreters_on_rehearsal_avail"
  end

  create_table "lighting_vendors", force: :cascade do |t|
    t.string   "name",                       null: false
    t.boolean  "deliver",    default: false
    t.boolean  "rental",     default: false
    t.boolean  "sales",      default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["deliver"], name: "index_lighting_vendors_on_deliver"
    t.index ["rental"], name: "index_lighting_vendors_on_rental"
    t.index ["sales"], name: "index_lighting_vendors_on_sales"
  end

  create_table "rehearsal_spaces", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "cost"
    t.string   "cost_unit"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cost"], name: "index_rehearsal_spaces_on_cost"
    t.index ["cost_unit"], name: "index_rehearsal_spaces_on_cost_unit"
  end

  create_table "scene_shops", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
