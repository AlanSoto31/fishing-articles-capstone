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

ActiveRecord::Schema.define(version: 2021_01_26_174500) do

  create_table "fishings", force: :cascade do |t|
    t.integer "authorid_id", null: false
    t.string "title"
    t.text "text"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["authorid_id"], name: "index_fishings_on_authorid_id"
  end

  create_table "priorities", force: :cascade do |t|
    t.string "name"
    t.string "priority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "userid_id", null: false
    t.integer "fishingid_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fishingid_id"], name: "index_votes_on_fishingid_id"
    t.index ["userid_id"], name: "index_votes_on_userid_id"
  end

  add_foreign_key "fishings", "authorids"
  add_foreign_key "votes", "fishingids"
  add_foreign_key "votes", "userids"
end
