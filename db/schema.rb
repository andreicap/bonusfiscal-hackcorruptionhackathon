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

ActiveRecord::Schema.define(version: 20160708202812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "citizens", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "name"
    t.string   "surname"
    t.string   "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_citizens_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_citizens_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_citizens_on_reset_password_token", unique: true, using: :btree
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "company_idno"
    t.string   "nr_bon_fiscal"
    t.string   "price",         default: ""
    t.string   "company",       default: ""
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "citizen_id"
    t.string   "data_el"
    t.index ["company_idno", "nr_bon_fiscal", "data_el"], name: "index_tickets_on_company_idno_and_nr_bon_fiscal_and_data_el", unique: true, using: :btree
  end

  create_table "winners", force: :cascade do |t|
    t.integer  "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
