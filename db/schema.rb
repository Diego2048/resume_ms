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

ActiveRecord::Schema.define(version: 20130703083321) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.boolean  "gender"
    t.date     "birth_on"
    t.date     "work_on"
    t.string   "degree"
    t.string   "email"
    t.string   "phone"
    t.string   "qq"
    t.string   "msn"
    t.string   "city"
    t.string   "address"
    t.string   "hukou"
    t.string   "family_tel"
    t.string   "company"
    t.string   "title"
    t.string   "industry"
    t.string   "website"
    t.text     "self_intro"
    t.text     "contact_records"
    t.integer  "score",           limit: 1
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
