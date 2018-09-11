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

ActiveRecord::Schema.define(version: 20180911080342) do

  create_table "admin_logs", force: :cascade do |t|
    t.integer  "admin_id"
    t.string   "type"
    t.text     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_admin_logs_on_admin_id"
  end

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
    t.datetime "last_seen"
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "admins_channel_cities", force: :cascade do |t|
    t.integer  "admin_id"
    t.integer  "channel_city_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["admin_id"], name: "index_admins_channel_cities_on_admin_id"
    t.index ["channel_city_id"], name: "index_admins_channel_cities_on_channel_city_id"
  end

  create_table "area_codes", force: :cascade do |t|
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "area_codes_channel_types", force: :cascade do |t|
    t.integer "area_code_id"
    t.integer "channel_type_id"
    t.index ["area_code_id"], name: "index_area_codes_channel_types_on_area_code_id"
    t.index ["channel_type_id"], name: "index_area_codes_channel_types_on_channel_type_id"
  end

  create_table "area_coverages", force: :cascade do |t|
    t.integer  "channel_city_id"
    t.string   "area"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "area_code_id"
    t.string   "slug"
    t.index ["area_code_id"], name: "index_area_coverages_on_area_code_id"
    t.index ["channel_city_id"], name: "index_area_coverages_on_channel_city_id"
  end

  create_table "channel_cities", force: :cascade do |t|
    t.string "city"
    t.string "slug"
    t.string "panel_name"
    t.string "background"
    t.index ["slug"], name: "index_channel_cities_on_slug"
  end

  create_table "channel_cities_channels", force: :cascade do |t|
    t.integer "channel_city_id"
    t.integer "channel_id"
    t.index ["channel_city_id"], name: "index_channel_cities_channels_on_channel_city_id"
    t.index ["channel_id"], name: "index_channel_cities_channels_on_channel_id"
  end

  create_table "channel_cities_types", force: :cascade do |t|
    t.integer "channel_city_id"
    t.integer "channel_type_id"
    t.index ["channel_city_id"], name: "index_channel_cities_types_on_channel_city_id"
    t.index ["channel_type_id"], name: "index_channel_cities_types_on_channel_type_id"
  end

  create_table "channel_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  create_table "channel_groups_channels", force: :cascade do |t|
    t.integer "channel_group_id"
    t.integer "channel_id"
    t.index ["channel_group_id"], name: "index_channel_groups_channels_on_channel_group_id"
    t.index ["channel_id"], name: "index_channel_groups_channels_on_channel_id"
  end

  create_table "channel_package_channel_groups", force: :cascade do |t|
    t.integer  "channel_package_id"
    t.integer  "channel_group_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["channel_group_id"], name: "index_channel_package_channel_groups_on_channel_group_id"
    t.index ["channel_package_id"], name: "index_channel_package_channel_groups_on_channel_package_id"
  end

  create_table "channel_package_prices", force: :cascade do |t|
    t.integer  "channel_package_id"
    t.integer  "price_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["channel_package_id"], name: "index_channel_package_prices_on_channel_package_id"
    t.index ["price_id"], name: "index_channel_package_prices_on_price_id"
  end

  create_table "channel_packages", force: :cascade do |t|
    t.integer  "channel_cities_type_id"
    t.integer  "package_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.text     "description"
    t.index ["channel_cities_type_id"], name: "index_channel_packages_on_channel_cities_type_id"
    t.index ["package_id"], name: "index_channel_packages_on_package_id"
  end

  create_table "channel_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "channels", force: :cascade do |t|
    t.string "name"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coverages", force: :cascade do |t|
    t.string   "name"
    t.text     "coordinates"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  create_table "menu_settings", force: :cascade do |t|
    t.string   "menu"
    t.string   "slug"
    t.string   "type"
    t.boolean  "is_active",       default: true
    t.boolean  "hidden_content",  default: false
    t.boolean  "disable_content", default: false
    t.integer  "parent_id"
    t.integer  "position"
    t.integer  "link_type",       default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "movie_schedules", force: :cascade do |t|
    t.string   "title"
    t.string   "logo"
    t.string   "schedule_attachment"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "payment_title"
    t.string   "slug"
  end

  create_table "preferences", force: :cascade do |t|
    t.text    "about_megavision"
    t.text    "about_starnet"
    t.text    "company_history"
    t.text    "company_vision_missions"
    t.text    "addresses"
    t.string  "copyright_text"
    t.string  "linked_in_url"
    t.string  "facebook_url"
    t.string  "twitter_url"
    t.string  "background_area_channel"
    t.string  "background_question_answer"
    t.string  "background_history"
    t.string  "background_vision_mission"
    t.string  "background_vacancy"
    t.string  "background_contact"
    t.string  "check_area"
    t.text    "subscribe_emails"
    t.text    "contact_emails"
    t.string  "chat_title"
    t.boolean "chat_status"
    t.string  "chat_off_message"
    t.string  "disclaimer_title"
    t.text    "disclaimer_content"
  end

  create_table "prices", force: :cascade do |t|
    t.decimal  "amount"
    t.integer  "up_to_speed"
    t.string   "unit"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.string   "icon"
    t.string   "description"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
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
