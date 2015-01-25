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

ActiveRecord::Schema.define(version: 20150125194812) do

  create_table "flags", force: true do |t|
    t.integer  "flagger_id",   null: false
    t.integer  "flaggee_id",   null: false
    t.string   "flag_type",    null: false
    t.integer  "flaggable_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flags", ["flag_type", "flaggee_id"], name: "index_flags_on_flag_type_and_flaggee_id"
  add_index "flags", ["flag_type", "flagger_id"], name: "index_flags_on_flag_type_and_flagger_id"
  add_index "flags", ["flaggee_id"], name: "index_flags_on_flaggee_id"
  add_index "flags", ["flagger_id"], name: "index_flags_on_flagger_id"

  create_table "gift_requests", force: true do |t|
    t.integer  "user_id",                     null: false
    t.string   "title",                       null: false
    t.text     "description",                 null: false
    t.boolean  "is_closed",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gift_requests", ["title", "is_closed"], name: "index_gift_requests_on_title_and_is_closed"
  add_index "gift_requests", ["title"], name: "index_gift_requests_on_title"
  add_index "gift_requests", ["user_id"], name: "index_gift_requests_on_user_id"

  create_table "gift_responses", force: true do |t|
    t.integer  "gift_request_id",                 null: false
    t.integer  "user_id",                         null: false
    t.text     "response_body",                   null: false
    t.boolean  "is_selected",     default: false, null: false
    t.boolean  "is_removed",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gift_responses", ["gift_request_id", "is_removed"], name: "index_gift_responses_on_gift_request_id_and_is_removed"
  add_index "gift_responses", ["gift_request_id"], name: "index_gift_responses_on_gift_request_id"
  add_index "gift_responses", ["is_selected"], name: "index_gift_responses_on_is_selected"
  add_index "gift_responses", ["user_id"], name: "index_gift_responses_on_user_id"

  create_table "products", force: true do |t|
    t.string   "title",                null: false
    t.integer  "gift_response_id",     null: false
    t.string   "product_url"
    t.string   "picture_url"
    t.text     "serialized_json_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["gift_response_id"], name: "index_products_on_gift_response_id"
  add_index "products", ["title"], name: "index_products_on_title"

  create_table "request_checklists", force: true do |t|
    t.integer  "gift_request_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "request_checklists", ["gift_request_id"], name: "index_request_checklists_on_gift_request_id"

  create_table "tag_types", force: true do |t|
    t.string   "tag_type_name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_types", ["tag_type_name"], name: "index_tag_types_on_tag_type_name"

  create_table "tags", force: true do |t|
    t.integer  "tag_type_id", null: false
    t.integer  "request_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["request_id", "tag_type_id"], name: "index_tags_on_request_id_and_tag_type_id", unique: true
  add_index "tags", ["request_id"], name: "index_tags_on_request_id"
  add_index "tags", ["tag_type_id"], name: "index_tags_on_tag_type_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.text     "profile_body"
    t.string   "encrypted_password"
    t.string   "session_token"
    t.string   "picture_url"
    t.integer  "reputation",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["reputation"], name: "index_users_on_reputation"
  add_index "users", ["session_token"], name: "index_users_on_session_token"
  add_index "users", ["username"], name: "index_users_on_username"

  create_table "votes", force: true do |t|
    t.integer  "gift_response_id", null: false
    t.integer  "voter_id",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["gift_response_id"], name: "index_votes_on_gift_response_id"
  add_index "votes", ["voter_id"], name: "index_votes_on_voter_id"

end
