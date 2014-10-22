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

ActiveRecord::Schema.define(version: 20141021104628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "imported_pets", force: true do |t|
    t.integer  "pet_id"
    t.text     "data"
    t.text     "logs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  add_index "imported_pets", ["pet_id"], name: "index_imported_pets_on_pet_id", using: :btree
  add_index "imported_pets", ["url"], name: "index_imported_pets_on_url", using: :btree

  create_table "pet_pictures", force: true do |t|
    t.integer  "pet_id"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pet_pictures", ["pet_id"], name: "index_pet_pictures_on_pet_id", using: :btree

  create_table "pets", force: true do |t|
    t.string   "name"
    t.string   "breed"
    t.integer  "sex"
    t.text     "description"
    t.string   "location"
    t.integer  "status"
    t.integer  "age"
    t.integer  "size"
    t.string   "more_info_url"
    t.boolean  "urgent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "specie"
    t.integer  "province_id"
  end

  add_index "pets", ["location", "status"], name: "index_pets_on_location_and_status", using: :btree
  add_index "pets", ["province_id"], name: "index_pets_on_province_id", using: :btree
  add_index "pets", ["specie", "size", "age"], name: "index_pets_on_specie_and_size_and_age", using: :btree
  add_index "pets", ["user_id"], name: "index_pets_on_user_id", using: :btree

  create_table "provinces", force: true do |t|
    t.string   "ine_name"
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "provinces", ["slug"], name: "index_provinces_on_slug", using: :btree

  create_table "shelters", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "web_url"
    t.string   "location"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role"
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
