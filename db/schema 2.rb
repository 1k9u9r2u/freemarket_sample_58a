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

ActiveRecord::Schema.define(version: 2019_09_21_032816) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "postal_code"
    t.integer "prefecture"
    t.string "city"
    t.string "street"
    t.string "building"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "f_name_kanji", limit: 15, default: "", null: false
    t.string "l_name_kanji", limit: 15, default: "", null: false
    t.string "f_name_kana", limit: 15, default: "", null: false
    t.string "l_name_kana", limit: 15, default: "", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "customer_id"
    t.string "card_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image"
    t.index ["product_id"], name: "index_images_on_product_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.text "detail", null: false
    t.integer "category", null: false
    t.integer "price", null: false
    t.integer "status", default: 0, null: false
    t.integer "state", default: 0, null: false
    t.integer "city", null: false
    t.integer "delivery", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fee_payer", null: false
    t.integer "delivery_time", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "sns_credentials", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sns_credentials_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", limit: 15, default: "", null: false
    t.string "f_name_kanji", limit: 15, default: "", null: false
    t.string "l_name_kanji", limit: 15, default: "", null: false
    t.string "f_name_kana", limit: 15, default: "", null: false
    t.string "l_name_kana", limit: 15, default: "", null: false
    t.date "birthday", null: false
    t.string "provider"
    t.string "uid"
    t.string "tel", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cards", "users"
  add_foreign_key "images", "products"
  add_foreign_key "products", "users"
  add_foreign_key "sns_credentials", "users"
end
