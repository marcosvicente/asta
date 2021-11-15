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

ActiveRecord::Schema.define(version: 2021_09_26_130616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_visualization_infos", force: :cascade do |t|
    t.string "column"
    t.string "value"
    t.bigint "data_visualization_item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["data_visualization_item_id"], name: "index_data_visualization_infos_on_data_visualization_item_id"
  end

  create_table "data_visualization_items", force: :cascade do |t|
    t.decimal "cx"
    t.decimal "cy"
    t.decimal "r"
    t.string "data_id"
    t.string "cluster"
    t.bigint "data_visualization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["data_visualization_id"], name: "index_data_visualization_items_on_data_visualization_id"
  end

  create_table "data_visualizations", force: :cascade do |t|
    t.string "cx"
    t.string "cy"
    t.string "r"
    t.string "data_id"
    t.string "cluster"
    t.bigint "import_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["import_id"], name: "index_data_visualizations_on_import_id"
  end

  create_table "imports", force: :cascade do |t|
    t.integer "status", default: 0
    t.string "file"
    t.bigint "user_id", null: false
    t.string "name"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_imports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "kind", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "data_visualization_infos", "data_visualization_items"
  add_foreign_key "data_visualization_items", "data_visualizations"
  add_foreign_key "data_visualizations", "imports"
  add_foreign_key "imports", "users"
end
