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

ActiveRecord::Schema.define(version: 20140203065931) do

  create_table "bus_stops", force: true do |t|
    t.integer  "stop_id"
    t.string   "cross_street"
    t.float    "boardings"
    t.float    "alightings"
    t.string   "month_beginning"
    t.string   "daytype"
    t.float    "loc_lat"
    t.float    "loc_long"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "on_street"
  end

  add_index "bus_stops", ["stop_id"], name: "index_bus_stops_on_stop_id"

  create_table "stop_on_routes", force: true do |t|
    t.integer  "stop_id"
    t.string   "route"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stop_on_routes", ["route"], name: "index_stop_on_routes_on_route"
  add_index "stop_on_routes", ["stop_id"], name: "index_stop_on_routes_on_stop_id"

  create_table "stops_on_routes", force: true do |t|
    t.integer  "stop_id"
    t.string   "route"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
