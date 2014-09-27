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

ActiveRecord::Schema.define(version: 20140927221446) do

  create_table "bookmark_views", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "visit"
  end

  add_index "bookmark_views", ["visit"], name: "index_bookmark_views_on_visit"

  create_table "events", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topic_views", force: true do |t|
    t.string   "topic_title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "visit"
  end

  add_index "topic_views", ["visit"], name: "index_topic_views_on_visit"

  create_table "tracked_apps", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "desc"
  end

  create_table "visits", force: true do |t|
    t.string   "email"
    t.string   "visitor_ip"
    t.integer  "ended_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
