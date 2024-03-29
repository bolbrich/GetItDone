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

ActiveRecord::Schema.define(:version => 20120101181129) do

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "projects", ["user_id", "id"], :name => "index_projects_on_user_id_and_id"

  create_table "to_dos", :force => true do |t|
    t.string   "title"
    t.text     "short_description"
    t.text     "details"
    t.date     "deadline"
    t.float    "time",              :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "priority"
    t.integer  "project_id"
    t.boolean  "done",              :default => false
  end

  add_index "to_dos", ["project_id", "id"], :name => "index_to_dos_on_project_id_and_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
