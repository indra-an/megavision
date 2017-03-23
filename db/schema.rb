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

ActiveRecord::Schema.define(version: 20170323125315) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "channel_cities", force: :cascade do |t|
    t.string "city"
  end

  create_table "channel_cities_channels", force: :cascade do |t|
    t.integer "channel_city_id"
    t.integer "channel_id"
    t.index ["channel_city_id"], name: "index_channel_cities_channels_on_channel_city_id"
    t.index ["channel_id"], name: "index_channel_cities_channels_on_channel_id"
  end

  create_table "channels", force: :cascade do |t|
    t.string "name"
  end

  create_table "landing_images", force: :cascade do |t|
    t.string   "title"
    t.text     "subtitle"
    t.string   "background"
    t.string   "addon_image"
    t.integer  "status",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "prices", force: :cascade do |t|
    t.decimal  "amount"
    t.integer  "up_to_speed"
    t.string   "unit"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacancies", force: :cascade do |t|
    t.string   "position"
    t.string   "icon"
    t.string   "location"
    t.text     "requirements"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
    t.index ["slug"], name: "index_vacancies_on_slug"
  end

end
