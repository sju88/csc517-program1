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

ActiveRecord::Schema.define(version: 20160226164906) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "preconfigured",   default: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true

  create_table "course_instructors", force: :cascade do |t|
    t.string   "course_number"
    t.string   "instructor_email"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "course_materials", force: :cascade do |t|
    t.string   "course_number"
    t.text     "material"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "course_number"
    t.string   "title"
    t.text     "description"
    t.string   "instructor"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "coursetemps", force: :cascade do |t|
    t.string   "course_number"
    t.string   "string"
    t.string   "title"
    t.text     "description"
    t.string   "instructor"
    t.string   "start_date"
    t.string   "datetime"
    t.string   "end_date"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "ctemps", force: :cascade do |t|
    t.string   "course_number"
    t.string   "string"
    t.string   "title"
    t.text     "description"
    t.string   "instructor"
    t.string   "start_date"
    t.string   "datetime"
    t.string   "end_date"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.string   "course_number"
    t.string   "student_email"
    t.boolean  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "grade"
  end

  create_table "instructors", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

end
