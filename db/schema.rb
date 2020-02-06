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

ActiveRecord::Schema.define(version: 2020_01_08_190901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_entries", force: :cascade do |t|
    t.bigint "food_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_food_entries_on_food_id"
    t.index ["user_id"], name: "index_food_entries_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "calories"
    t.string "fat"
    t.string "carbs"
    t.string "protein"
    t.string "portion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.integer "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "food_entries", "foods"
  add_foreign_key "food_entries", "users"
end
