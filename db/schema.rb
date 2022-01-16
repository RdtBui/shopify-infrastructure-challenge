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

ActiveRecord::Schema.define(version: 2022_01_16_220221) do

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.text "summary"
    t.string "sku"
    t.float "price"
    t.integer "quantity"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "brand"
  end

  create_table "logs", force: :cascade do |t|
    t.string "item_title"
    t.string "item_sku"
    t.float "item_price"
    t.integer "item_quantity"
    t.string "item_brand"
    t.string "string"
    t.string "item_category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
