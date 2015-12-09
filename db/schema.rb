# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151209120701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "accesstoken"
    t.string   "refreshtoken"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "nickname"
    t.string   "image"
    t.string   "phone"
    t.string   "urls"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "image"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pictures", ["project_id"], name: "index_pictures_on_project_id", using: :btree

  create_table "pledges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "reward_id"
    t.boolean  "paid"
  end

  add_index "pledges", ["project_id"], name: "index_pledges_on_project_id", using: :btree
  add_index "pledges", ["reward_id"], name: "index_pledges_on_reward_id", using: :btree
  add_index "pledges", ["user_id"], name: "index_pledges_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "target"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "user_id"
    t.string   "location"
    t.text     "summary"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "project_image"
    t.integer  "days"
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id", using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "rewards", force: :cascade do |t|
    t.integer  "project_id"
    t.text     "description"
    t.integer  "value"
    t.integer  "quantity"
    t.date     "delivery"
    t.string   "ships_to"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "rewards", ["project_id"], name: "index_rewards_on_project_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "postcode"
    t.string   "role"
    t.string   "last_name"
    t.string   "username"
    t.string   "user_image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "identities", "users"
  add_foreign_key "pictures", "projects"
  add_foreign_key "pledges", "projects"
  add_foreign_key "pledges", "rewards"
  add_foreign_key "pledges", "users"
  add_foreign_key "projects", "categories"
  add_foreign_key "projects", "users"
  add_foreign_key "rewards", "projects"
end
