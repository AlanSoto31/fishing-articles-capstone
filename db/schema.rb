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

ActiveRecord::Schema.define(version: 2021_01_28_184743) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "priority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categorizes", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "fishing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_categorizes_on_category_id"
    t.index ["fishing_id"], name: "index_categorizes_on_fishing_id"
  end

  create_table "fishings", force: :cascade do |t|
    t.integer "author_id"
    t.string "title"
    t.text "text"
    t.string "imagen"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "votes_count"
    t.index ["author_id"], name: "index_fishings_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "fishing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fishing_id"], name: "index_votes_on_fishing_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "categorizes", "categories"
  add_foreign_key "categorizes", "fishings"
  add_foreign_key "fishings", "users", column: "author_id"
  add_foreign_key "votes", "fishings"
  add_foreign_key "votes", "users"
end
