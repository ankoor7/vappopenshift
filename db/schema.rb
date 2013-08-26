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

ActiveRecord::Schema.define(:version => 20130824170914) do

  create_table "charities", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "phone"
    t.string   "email"
    t.text     "description"
    t.string   "website"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "events", :force => true do |t|
    t.integer  "charity_id"
    t.string   "name"
    t.string   "location"
    t.integer  "number_volunteers"
    t.datetime "date"
    t.text     "description"
    t.text     "special_instructions"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "events_volunteers", :force => true do |t|
    t.integer  "event_id"
    t.integer  "volunteer_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "events_volunteers", ["event_id", "volunteer_id"], :name => "index_events_volunteers_on_event_id_and_volunteer_id", :unique => true
  add_index "events_volunteers", ["event_id"], :name => "index_events_volunteers_on_event_id"
  add_index "events_volunteers", ["volunteer_id"], :name => "index_events_volunteers_on_volunteer_id"

  create_table "groups", :force => true do |t|
    t.integer  "charity_id"
    t.string   "name"
    t.string   "location"
    t.string   "email"
    t.string   "phone"
    t.string   "website"
    t.integer  "groups_leaders_id"
    t.integer  "groups_volunteers_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "groups", ["charity_id"], :name => "index_groups_on_charity_id"

  create_table "groups_leaders", :force => true do |t|
    t.integer  "group_id"
    t.integer  "leader_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "groups_leaders", ["group_id", "leader_id"], :name => "index_groups_leaders_on_group_id_and_leader_id", :unique => true
  add_index "groups_leaders", ["group_id"], :name => "index_groups_leaders_on_group_id"
  add_index "groups_leaders", ["leader_id"], :name => "index_groups_leaders_on_leader_id"

  create_table "groups_volunteers", :force => true do |t|
    t.integer  "group_id"
    t.integer  "volunteer_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "groups_volunteers", ["group_id", "volunteer_id"], :name => "index_groups_volunteers_on_group_id_and_volunteer_id", :unique => true
  add_index "groups_volunteers", ["group_id"], :name => "index_groups_volunteers_on_group_id"
  add_index "groups_volunteers", ["volunteer_id"], :name => "index_groups_volunteers_on_volunteer_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",     :null => false
    t.string   "encrypted_password",     :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role",                   :default => "user", :null => false
    t.string   "firstname",                                  :null => false
    t.string   "lastname",                                   :null => false
    t.string   "phone",                                      :null => false
    t.boolean  "t_and_c",                :default => false,  :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
