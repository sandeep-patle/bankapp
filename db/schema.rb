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

ActiveRecord::Schema.define(:version => 20140604075754) do

  create_table "account_transactions", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.decimal  "amount",           :precision => 5, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
    t.string   "transaction_type"
    t.string   "depositer"
  end

  create_table "accounts", :force => true do |t|
    t.integer  "account_number"
    t.decimal  "balance",        :precision => 5, :scale => 2, :default => 0.0
    t.integer  "user_id"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "mobile_number"
    t.string   "city"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "user_id"
    t.string   "password"
    t.string   "role",          :default => "account_holder"
  end

end
