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

ActiveRecord::Schema.define(version: 20170415140732) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street1",       null: false
    t.string   "street2"
    t.string   "city",          null: false
    t.string   "state",         null: false
    t.integer  "zip_code",      null: false
    t.integer  "location_id",   null: false
    t.string   "location_type", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["location_id"], name: "index_addresses_on_location_id"
    t.index ["location_type"], name: "index_addresses_on_location_type"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",          null: false
    t.integer  "employer_id",   null: false
    t.string   "employer_type", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["employer_id"], name: "index_contacts_on_employer_id"
    t.index ["employer_type"], name: "index_contacts_on_employer_type"
  end

  create_table "emails", force: :cascade do |t|
    t.string   "address",        null: false
    t.integer  "recipient_id",   null: false
    t.string   "recipient_type", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["recipient_id"], name: "index_emails_on_recipient_id"
    t.index ["recipient_type"], name: "index_emails_on_recipient_type"
  end

  create_table "hours", force: :cascade do |t|
    t.integer  "day_of_week",                null: false
    t.integer  "open"
    t.integer  "close"
    t.boolean  "closed",      default: true
    t.integer  "vendor_id",                  null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["closed"], name: "index_hours_on_closed"
    t.index ["vendor_id"], name: "index_hours_on_vendor_id"
  end

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

  create_table "phones", force: :cascade do |t|
    t.string   "number",     null: false
    t.integer  "owner_id",   null: false
    t.string   "owner_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_phones_on_owner_id"
    t.index ["owner_type"], name: "index_phones_on_owner_type"
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
