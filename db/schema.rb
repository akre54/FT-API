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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121022024623) do

  create_table "api_clients", :primary_key => "api_key", :force => true do |t|
    t.string "client_name", :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name",                                        :null => false
    t.string   "email",                       :default => "", :null => false
    t.string   "crypted_pin",   :limit => 48,                 :null => false
    t.string   "salt",          :limit => 15,                 :null => false
    t.string   "phone",                       :default => "", :null => false
    t.string   "fb_id",                       :default => "", :null => false
    t.string   "fb_token",      :limit => 64, :default => "", :null => false
    t.string   "twitter_id",    :limit => 24, :default => "", :null => false
    t.string   "twitter_token", :limit => 64, :default => "", :null => false
    t.string   "fsq_id",                      :default => "", :null => false
    t.string   "fsq_token",     :limit => 64, :default => "", :null => false
    t.string   "img_url",                     :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["email"], :name => "email", :unique => true

  create_table "customers_farms", :id => false, :force => true do |t|
    t.integer "customer_id", :null => false
    t.integer "farm_id",     :null => false
  end

  create_table "farms", :force => true do |t|
    t.string   "email",                                      :null => false
    t.string   "pass",         :limit => 48,                 :null => false
    t.string   "salt",         :limit => 15,                 :null => false
    t.string   "pin",                        :default => "", :null => false
    t.string   "farm_name",                                  :null => false
    t.string   "farm_address",               :default => "", :null => false
    t.string   "description",                :default => "", :null => false
    t.string   "website",                    :default => "", :null => false
    t.string   "phone",                      :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", :force => true do |t|
    t.integer "item_id",      :null => false
    t.string  "farm_id",      :null => false
    t.string  "stock",        :null => false
    t.boolean "availability", :null => false
  end

  create_table "items", :force => true do |t|
    t.string  "name",        :null => false
    t.string  "description", :null => false
    t.integer "photo",       :null => false
    t.string  "ppu",         :null => false
    t.string  "unit_size",   :null => false
    t.string  "quantity",    :null => false
    t.string  "link",        :null => false
  end

  create_table "login_attempts", :force => true do |t|
    t.string   "email",              :limit => 256, :null => false
    t.string   "request_user_agent", :limit => 512, :null => false
    t.datetime "request_timestamp",                 :null => false
    t.string   "request_ip",         :limit => 64,  :null => false
    t.boolean  "login_successful",                  :null => false
  end

  create_table "photos", :force => true do |t|
    t.string  "filename", :null => false
    t.integer "user",     :null => false
    t.integer "farm",     :null => false
  end

  create_table "schedule", :force => true do |t|
    t.string "M",  :null => false
    t.string "T",  :null => false
    t.string "W",  :null => false
    t.string "Th", :null => false
    t.string "F",  :null => false
    t.string "Sa", :null => false
    t.string "Su", :null => false
    t.string "H",  :null => false
  end

  create_table "tabs", :force => true do |t|
    t.integer "farm_id",                                                     :null => false
    t.integer "customer_id",                                                 :null => false
    t.decimal "balance",     :precision => 10, :scale => 2, :default => 0.0, :null => false
  end

  add_index "tabs", ["farm_id", "customer_id"], :name => "UNIQUE", :unique => true

  create_table "transactions", :force => true do |t|
    t.string   "receipt_dump"
    t.float    "amount",       :limit => 255, :null => false
    t.integer  "venue_id",                    :null => false
    t.integer  "farm_id",                     :null => false
    t.integer  "user_id",                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", :force => true do |t|
    t.string "venue_name",    :null => false
    t.string "venue_address", :null => false
    t.string "schedule",      :null => false
    t.float  "lat",           :null => false
    t.float  "long",          :null => false
    t.string "social",        :null => false
  end

end
