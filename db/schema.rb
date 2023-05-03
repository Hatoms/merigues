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

ActiveRecord::Schema[7.0].define(version: 2023_03_21_205852) do
  create_table "baskets", force: :cascade do |t|
    t.text "content"
    t.date "date"
    t.integer "limit_max_baskets", default: 30
    t.boolean "exceptional_sale", default: false
    t.text "exceptional_sale_content", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password"
    t.boolean "admin", default: false
    t.boolean "engaged_client", default: false
    t.string "phone"
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "basket_id"
    t.integer "customer_id"
    t.float "additional_expense", default: 0.0
    t.boolean "recovered", default: false
    t.boolean "paid", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["basket_id", "customer_id"], name: "index_orders_on_basket_id_and_customer_id", unique: true
    t.index ["basket_id"], name: "index_orders_on_basket_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

end
