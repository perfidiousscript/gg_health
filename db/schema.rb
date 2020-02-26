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

ActiveRecord::Schema.define(version: 2020_02_26_225429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.jsonb "contact", default: "{}", null: false
    t.jsonb "services", default: "{}", null: false
    t.bigint "practices_id"
    t.index ["practices_id"], name: "index_locations_on_practices_id"
  end

  create_table "practices", force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "contact", default: "{}", null: false
    t.bigint "users_id"
    t.text "staff", default: [], array: true
    t.index ["users_id"], name: "index_practices_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email_address", null: false
    t.integer "role", default: 0, null: false
  end

  add_foreign_key "locations", "practices", column: "practices_id"
  add_foreign_key "practices", "users", column: "users_id"
end
