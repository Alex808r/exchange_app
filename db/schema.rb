# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 2023_11_27_122055) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exchange_rates", force: :cascade do |t|
    t.date "date", null: false
    t.decimal "rub_to_usd", precision: 10, scale: 4
    t.decimal "rub_to_eur", precision: 10, scale: 4
    t.decimal "rub_to_cny", precision: 10, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_exchange_rates_on_date", unique: true
  end
end
