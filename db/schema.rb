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

ActiveRecord::Schema.define(version: 20140219155913) do

  create_table "attributes", force: true do |t|
    t.string   "attribute_name"
    t.binary   "good"
    t.integer  "opposite_identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "identifier"
  end

  add_index "attributes", ["identifier"], name: "index_attributes_on_identifier", unique: true

  create_table "feedbacks", force: true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.integer  "attribute_identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "rating_given"
  end

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "attribute_identifier"
    t.float    "current_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
