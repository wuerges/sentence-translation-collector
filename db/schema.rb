# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_16_184018) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_languages_on_code", unique: true
    t.index ["name"], name: "index_languages_on_name", unique: true
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "date"
    t.integer "hits"
    t.integer "misses"
    t.integer "user_id", null: false
    t.integer "sentence_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sentence_id"], name: "index_schedules_on_sentence_id"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "sentences", force: :cascade do |t|
    t.string "text"
    t.integer "language_id", null: false
    t.integer "origin_id"
    t.integer "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"text\", \"language\"", name: "index_sentences_on_text_and_language"
    t.index ["author_id"], name: "index_sentences_on_author_id"
    t.index ["language_id"], name: "index_sentences_on_language_id"
    t.index ["origin_id"], name: "index_sentences_on_origin_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "schedules", "sentences"
  add_foreign_key "schedules", "users"
  add_foreign_key "sentences", "languages"
  add_foreign_key "sentences", "sentences", column: "origin_id"
  add_foreign_key "sentences", "users", column: "author_id"
end
