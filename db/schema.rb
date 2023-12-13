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

ActiveRecord::Schema[7.1].define(version: 2023_12_13_215217) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "background_migration_jobs", force: :cascade do |t|
    t.bigint "migration_id", null: false
    t.bigint "min_value", null: false
    t.bigint "max_value", null: false
    t.integer "batch_size", null: false
    t.integer "sub_batch_size", null: false
    t.integer "pause_ms", null: false
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "status", default: "enqueued", null: false
    t.integer "max_attempts", null: false
    t.integer "attempts", default: 0, null: false
    t.string "error_class"
    t.string "error_message"
    t.string "backtrace", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["migration_id", "finished_at"], name: "index_background_migration_jobs_on_finished_at"
    t.index ["migration_id", "max_value"], name: "index_background_migration_jobs_on_max_value"
    t.index ["migration_id", "status", "updated_at"], name: "index_background_migration_jobs_on_updated_at"
  end

  create_table "background_migrations", force: :cascade do |t|
    t.string "migration_name", null: false
    t.jsonb "arguments", default: [], null: false
    t.string "batch_column_name", null: false
    t.bigint "min_value", null: false
    t.bigint "max_value", null: false
    t.bigint "rows_count"
    t.integer "batch_size", null: false
    t.integer "sub_batch_size", null: false
    t.integer "batch_pause", null: false
    t.integer "sub_batch_pause_ms", null: false
    t.integer "batch_max_attempts", null: false
    t.string "status", default: "enqueued", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["migration_name", "arguments"], name: "index_background_migrations_on_unique_configuration", unique: true
  end

  create_table "lembagas", force: :cascade do |t|
    t.string "nama_lembaga"
    t.string "kode_lembaga"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "background_migration_jobs", "background_migrations", column: "migration_id", on_delete: :cascade
end
