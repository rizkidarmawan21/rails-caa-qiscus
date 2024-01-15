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

ActiveRecord::Schema[7.1].define(version: 2024_01_14_082602) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "agent_reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "limit"
    t.boolean "is_resolve"
  end

  create_table "caa_webhook_logs", force: :cascade do |t|
    t.json "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.bigint "queue_chat_id", null: false
    t.bigint "agent_id", null: false
    t.datetime "assigned_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_resolve"
    t.index ["agent_id"], name: "index_histories_on_agent_id"
    t.index ["queue_chat_id"], name: "index_histories_on_queue_chat_id"
  end

  create_table "queue_chats", force: :cascade do |t|
    t.string "room_id"
    t.boolean "status"
    t.string "source"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "histories", "agents"
  add_foreign_key "histories", "queue_chats"
end
