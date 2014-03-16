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

ActiveRecord::Schema.define(:version => 20140317174913) do

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "profile_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "blogs", ["profile_id"], :name => "index_blogs_on_profile_id"

  create_table "comments", :force => true do |t|
    t.text     "comment"
    t.integer  "profile_id"
    t.string   "commentable_type", :default => "",    :null => false
    t.integer  "commentable_id",                      :null => false
    t.integer  "is_denied",        :default => 0,     :null => false
    t.boolean  "is_reviewed",      :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["profile_id"], :name => "index_comments_on_profile_id"

  create_table "feed_items", :force => true do |t|
    t.boolean  "include_comments", :default => false, :null => false
    t.boolean  "is_public",        :default => false, :null => false
    t.integer  "item_id"
    t.string   "item_type"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "feed_items", ["item_id", "item_type"], :name => "index_feed_items_on_item_id_and_item_type"

  create_table "feeds", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "feed_item_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "feeds", ["profile_id", "feed_item_id"], :name => "index_feeds_on_profile_id_and_feed_item_id"

  create_table "forum_posts", :force => true do |t|
    t.text     "body"
    t.integer  "owner_id"
    t.integer  "topic_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "forum_posts", ["topic_id"], :name => "index_forum_posts_on_topic_id"

  create_table "forum_topics", :force => true do |t|
    t.string   "title"
    t.integer  "forum_id"
    t.integer  "owner_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "forum_topics", ["forum_id"], :name => "index_forum_topics_on_forum_id"

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "friends", :force => true do |t|
    t.integer  "inviter_id"
    t.integer  "invited_id"
    t.integer  "status",     :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "friends", ["invited_id", "inviter_id"], :name => "index_friends_on_invited_id_and_inviter_id", :unique => true
  add_index "friends", ["inviter_id", "invited_id"], :name => "index_friends_on_inviter_id_and_invited_id", :unique => true

  create_table "messages", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.boolean  "read",        :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "messages", ["receiver_id"], :name => "index_messages_on_receiver_id"
  add_index "messages", ["sender_id"], :name => "index_messages_on_sender_id"

  create_table "photos", :force => true do |t|
    t.string   "caption",            :limit => 500
    t.integer  "profile_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "photos", ["profile_id"], :name => "index_photos_on_profile_id"

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "website"
    t.string   "blog"
    t.string   "twitter"
    t.string   "facebook"
    t.text     "about_me"
    t.string   "gtalk_name"
    t.string   "location"
    t.string   "email"
    t.string   "alternate_email"
    t.boolean  "is_active",         :default => false
    t.string   "youtube_username"
    t.string   "time_zone",         :default => "UTC"
    t.datetime "last_activity_at"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email",               :default => "",   :null => false
    t.string   "login"
    t.boolean  "is_admin"
    t.boolean  "can_send_messages",   :default => true
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "crypted_password",                      :null => false
    t.string   "password_salt",                         :null => false
    t.string   "persistence_token",                     :null => false
    t.string   "single_access_token",                   :null => false
    t.integer  "login_count",         :default => 0,    :null => false
    t.integer  "failed_login_count",  :default => 0,    :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login"

end
