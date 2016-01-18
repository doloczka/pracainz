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

ActiveRecord::Schema.define(version: 20160116175432) do

  create_table "answers", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "student_id"
    t.text     "exercise"
    t.text     "content"
    t.boolean  "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "answers", ["student_id"], name: "index_answers_on_student_id"
  add_index "answers", ["teacher_id"], name: "index_answers_on_teacher_id"

  create_table "exercises", force: :cascade do |t|
    t.integer  "lesson_id"
    t.integer  "number"
    t.integer  "reward"
    t.text     "story"
    t.text     "content"
    t.text     "hint"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "exercises", ["lesson_id"], name: "index_exercises_on_lesson_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.integer  "teacher_id"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["teacher_id"], name: "index_groups_on_teacher_id"

  create_table "lessons", force: :cascade do |t|
    t.integer  "number"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lessons", ["teacher_id"], name: "index_lessons_on_teacher_id"

  create_table "messages", force: :cascade do |t|
    t.string   "subject"
    t.text     "content"
    t.boolean  "read"
    t.integer  "sender"
    t.integer  "recipient"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progres", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "points"
    t.integer  "hp"
    t.integer  "expe"
    t.integer  "lvl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "progres", ["student_id"], name: "index_progres_on_student_id"

  create_table "students", force: :cascade do |t|
    t.string   "login"
    t.string   "password_digest"
    t.string   "email"
    t.string   "name"
    t.string   "lastname"
    t.integer  "albumnumber"
    t.boolean  "authenticated"
    t.integer  "group_id"
    t.integer  "presence"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "students", ["group_id"], name: "index_students_on_group_id"

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "login"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "teachers", ["login"], name: "index_teachers_on_login", unique: true

end
