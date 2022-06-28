# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 3) do
  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "card_number"
    t.string "username"
    t.string "password"
    t.date "birthday"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "price"
    t.string "date"
    t.integer "customer_id"
    t.integer "merchant_id"
    t.index ["customer_id"], name: "index_transactions_on_customer_id"
    t.index ["merchant_id"], name: "index_transactions_on_merchant_id"
  end

end
