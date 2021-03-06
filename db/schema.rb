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

ActiveRecord::Schema.define(version: 2019_06_13_130655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bitcoins", force: :cascade do |t|
    t.integer "quantity"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bitcoins_users", force: :cascade do |t|
    t.integer "bitcoin_id"
    t.integer "user_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.text "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "portfolios_shares", force: :cascade do |t|
    t.integer "portfolio_id"
    t.integer "share_id"
  end

  create_table "portfolios_stocks", force: :cascade do |t|
    t.integer "portfolio_id"
    t.integer "stock_id"
  end

  create_table "shares", force: :cascade do |t|
    t.text "name"
    t.text "ticker"
    t.integer "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
  end

  create_table "stocks", force: :cascade do |t|
    t.text "name"
    t.text "ticker"
    t.integer "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "industry"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "funds"
  end

end
