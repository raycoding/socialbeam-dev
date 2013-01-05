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

ActiveRecord::Schema.define(:version => 20130105160816) do

  create_table "messages", :force => true do |t|
    t.string   "sender_id",                              :null => false
    t.string   "recepient_id"
    t.boolean  "sender_deleted",    :default => false
    t.boolean  "recepient_deleted", :default => false
    t.string   "subject",                                :null => false
    t.text     "body"
    t.datetime "read_at"
    t.string   "container",         :default => "draft"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "scribbles", :force => true do |t|
    t.string   "post"
    t.string   "posted_by"
    t.integer  "posted_by_uid"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "ups"
    t.integer  "downs"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "profile_name",  :default => "beamer"
    t.string   "profile_id",                          :null => false
    t.string   "beamer_id",                           :null => false
  end

end
