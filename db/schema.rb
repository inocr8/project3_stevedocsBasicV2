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

ActiveRecord::Schema.define(version: 20160309234929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "colour"
    t.string   "category_image"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "document_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["document_id"], name: "index_comments_on_document_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.text     "short"
    t.text     "tags"
    t.text     "content"
    t.string   "document_image"
    t.integer  "category_id"
    t.integer  "language_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "documents", ["category_id"], name: "index_documents_on_category_id", using: :btree
  add_index "documents", ["language_id"], name: "index_documents_on_language_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.string   "colour"
    t.string   "language_image"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "libraries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "document_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "libraries", ["document_id"], name: "index_libraries_on_document_id", using: :btree
  add_index "libraries", ["user_id"], name: "index_libraries_on_user_id", using: :btree

  create_table "searches", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "document_id"
    t.integer  "category_id"
    t.integer  "language_id"
    t.integer  "library_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "searches", ["category_id"], name: "index_searches_on_category_id", using: :btree
  add_index "searches", ["document_id"], name: "index_searches_on_document_id", using: :btree
  add_index "searches", ["language_id"], name: "index_searches_on_language_id", using: :btree
  add_index "searches", ["library_id"], name: "index_searches_on_library_id", using: :btree
  add_index "searches", ["user_id"], name: "index_searches_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
    t.string   "company"
    t.string   "bio"
    t.string   "name"
    t.string   "twitter"
    t.string   "user_image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "documents"
  add_foreign_key "comments", "users"
  add_foreign_key "documents", "categories"
  add_foreign_key "documents", "languages"
  add_foreign_key "libraries", "documents"
  add_foreign_key "libraries", "users"
  add_foreign_key "searches", "categories"
  add_foreign_key "searches", "documents"
  add_foreign_key "searches", "languages"
  add_foreign_key "searches", "libraries"
  add_foreign_key "searches", "users"
end
