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

ActiveRecord::Schema.define(version: 2020_03_21_064959) do

  create_table "accesses", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accidents", force: :cascade do |t|
    t.integer "question_user_id", null: false
    t.boolean "status", default: false, null: false
    t.text "title", null: false
    t.text "body", null: false
    t.string "situation_img_id"
    t.text "question_user_damage"
    t.text "the_other_damage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "answer_user_slills", force: :cascade do |t|
    t.integer "answer_user_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "answer_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.integer "score", default: 0, null: false
    t.integer "level", default: 0, null: false
    t.text "production"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
    t.integer "career"
    t.integer "speciality"
    t.integer "qualification"
    t.index ["email"], name: "index_answer_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_answer_users_on_reset_password_token", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.integer "answer_user_id", null: false
    t.integer "question_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "best_answers", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "answer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "question_user_id", null: false
    t.integer "answer_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_tags", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_question_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_question_users_on_reset_password_token", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.integer "question_user_id", null: false
    t.boolean "status", default: false, null: false
    t.text "title", null: false
    t.text "body", null: false
    t.integer "access_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "accident_id"
  end

  create_table "skills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
    t.integer "career"
    t.integer "speciality"
    t.integer "qualification"
    t.integer "answer_user_id"
  end

  create_table "solution_reports", force: :cascade do |t|
    t.integer "accident_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
