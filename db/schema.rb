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

# From SE: For new installations you should be running rake db:schema:load, not 
# rake db:migrate, this will load the schema into the database, which is faster than running all the 
# migrations.

# You should never delete migrations, and certainly not combine them. As for accidentally deleting 
# one, you should be using a version control system, such as Git.

ActiveRecord::Schema.define(version: 20140222195953) do

  create_table "attributes", force: true do |t|
    t.string   "attribute_name"
    t.binary   "good"
    t.integer  "opposite_identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "identifier"
  end

  add_index "attributes", ["identifier"], name: "index_attributes_on_identifier", unique: true

  create_table "companies", force: true do |t|
    t.string   "domain"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_employees", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_employees", ["company_id", "user_id"], name: "index_company_employees_on_company_id_and_user_id"

  create_table "feedbacks", force: true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.integer  "attribute_identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "rating_given"
  end

  add_index "feedbacks", ["from_id", "to_id"], name: "index_feedbacks_on_from_id_and_to_id"

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "project_attributes", force: true do |t|
    t.integer  "identifier"
    t.string   "project_attribute_name"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_attributes", ["identifier"], name: "index_project_attributes_on_identifier", unique: true
  add_index "project_attributes", ["project_id"], name: "index_project_attributes_on_project_id"

  create_table "project_feedbacks", force: true do |t|
    t.integer  "from_id"
    t.integer  "to_project_id"
    t.integer  "project_attribute_identifier"
    t.integer  "rating_given"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_feedbacks", ["from_id", "to_project_id"], name: "index_project_feedbacks_on_from_id_and_to_project_id"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "domain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["domain_id"], name: "index_projects_on_domain_id"


  create_table "ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "attribute_identifier"
    t.float    "current_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
