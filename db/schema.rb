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

ActiveRecord::Schema.define(:version => 20130804104530) do

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "privacy"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "albums", ["user_id"], :name => "index_albums_on_user_id"

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "photo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["photo_id"], :name => "index_comments_on_photo_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "album_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "photo_picture"
    t.integer  "popularity"
    t.integer  "cached_votes_total", :default => 0
    t.integer  "cached_votes_score", :default => 0
    t.integer  "cached_votes_up",    :default => 0
    t.integer  "cached_votes_down",  :default => 0
  end

  add_index "photos", ["album_id"], :name => "index_photos_on_album_id"
  add_index "photos", ["cached_votes_down"], :name => "index_photos_on_cached_votes_down"
  add_index "photos", ["cached_votes_score"], :name => "index_photos_on_cached_votes_score"
  add_index "photos", ["cached_votes_total"], :name => "index_photos_on_cached_votes_total"
  add_index "photos", ["cached_votes_up"], :name => "index_photos_on_cached_votes_up"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.string   "avatar"
    t.text     "biography"
    t.string   "location"
    t.string   "role"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
