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

ActiveRecord::Schema.define(version: 20160319071510) do

  create_table "answers", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "student_id"
    t.integer  "exercise_id"
    t.text     "solution"
    t.integer  "reward"
    t.boolean  "read"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["exercise_id"], name: "index_answers_on_exercise_id"
  add_index "answers", ["student_id"], name: "index_answers_on_student_id"
  add_index "answers", ["teacher_id"], name: "index_answers_on_teacher_id"

  create_table "awarded_medals", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "medal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "awarded_medals", ["student_id", "medal_id"], name: "index_awarded_medals_on_student_id_and_medal_id", unique: true

  create_table "classescalendars", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "classes_number"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "classescalendars", ["group_id"], name: "index_classescalendars_on_group_id"

  create_table "drawnexercises", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "level"
    t.integer  "number"
    t.integer  "exercise_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "drawnexercises", ["exercise_id"], name: "index_drawnexercises_on_exercise_id"
  add_index "drawnexercises", ["student_id"], name: "index_drawnexercises_on_student_id"

  create_table "exercises", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "level"
    t.integer  "number"
    t.integer  "reward"
    t.text     "content"
    t.text     "hint"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "variant"
  end

  add_index "exercises", ["teacher_id"], name: "index_exercises_on_teacher_id"

  create_table "groups", force: :cascade do |t|
    t.integer  "teacher_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["teacher_id"], name: "index_groups_on_teacher_id"

  create_table "medals", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.string   "img"
    t.integer  "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "subject"
    t.text     "content"
    t.boolean  "read"
    t.integer  "direction"
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_mails", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "presences", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "classes_number"
    t.boolean  "present"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "presences", ["student_id"], name: "index_presences_on_student_id"

  create_table "progres", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "points"
    t.integer  "hp"
    t.integer  "gained_points"
    t.integer  "lvl"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "total"
    t.decimal  "rate"
    t.integer  "variant"
  end

  add_index "progres", ["student_id"], name: "index_progres_on_student_id"

  create_table "results", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "level"
    t.integer  "exercise_id"
    t.integer  "earned_points"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "results", ["exercise_id"], name: "index_results_on_exercise_id"
  add_index "results", ["student_id"], name: "index_results_on_student_id"

  create_table "sidequests", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "level"
    t.text     "content"
    t.integer  "reward"
    t.boolean  "finished"
    t.datetime "finish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sidequests", ["teacher_id"], name: "index_sidequests_on_teacher_id"

  create_table "sqanswers", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "student_id"
    t.integer  "sidequest_id"
    t.text     "solution"
    t.integer  "reward"
    t.boolean  "read"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "sqanswers", ["sidequest_id"], name: "index_sqanswers_on_sidequest_id"
  add_index "sqanswers", ["student_id"], name: "index_sqanswers_on_student_id"
  add_index "sqanswers", ["teacher_id"], name: "index_sqanswers_on_teacher_id"

  create_table "sqresults", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "sidequest_id"
    t.integer  "level"
    t.integer  "earned_points"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "sqresults", ["sidequest_id"], name: "index_sqresults_on_sidequest_id"
  add_index "sqresults", ["student_id"], name: "index_sqresults_on_student_id"

  create_table "stories", force: :cascade do |t|
    t.integer  "level"
    t.integer  "number"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "login"
    t.string   "password_digest"
    t.string   "email"
    t.string   "name"
    t.string   "lastname"
    t.string   "album_number"
    t.integer  "group_id"
    t.boolean  "autenticated"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "students", ["group_id"], name: "index_students_on_group_id"
  add_index "students", ["login"], name: "index_students_on_login", unique: true

  create_table "teachers", force: :cascade do |t|
    t.string   "login"
    t.string   "password_digest"
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "teachers", ["login"], name: "index_teachers_on_login", unique: true

end
