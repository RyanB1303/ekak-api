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

ActiveRecord::Schema[7.1].define(version: 2023_12_15_152847) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_tokens", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "token", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_api_tokens_on_user_id"
  end

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

  create_table "bidang_urusans", force: :cascade do |t|
    t.string "bidang_urusan"
    t.string "kode_bidang_urusan"
    t.string "keterangan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "indikators", force: :cascade do |t|
    t.string "indikator"
    t.string "indikatorable_type"
    t.bigint "indikatorable_id"
    t.string "keterangan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["indikatorable_type", "indikatorable_id"], name: "index_indikators_on_indikatorable"
  end

  create_table "kegiatans", force: :cascade do |t|
    t.string "kegiatan"
    t.string "kode_kegiatan"
    t.string "keterangan"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lembagas", force: :cascade do |t|
    t.string "nama_lembaga"
    t.string "kode_lembaga"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opds", force: :cascade do |t|
    t.string "nama_opd", null: false
    t.string "kode_opd", null: false
    t.boolean "active", default: true
    t.bigint "lembaga_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lembaga_id"], name: "index_opds_on_lembaga_id"
  end

  create_table "periodes", force: :cascade do |t|
    t.string "nama_periode"
    t.integer "tahun_awal"
    t.integer "tahun_akhir"
    t.string "keterangan"
    t.bigint "lembaga_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lembaga_id"], name: "index_periodes_on_lembaga_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "program"
    t.string "kode_program"
    t.string "keterangan"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tahuns", force: :cascade do |t|
    t.integer "tahun"
    t.string "kelompok_anggaran"
    t.string "keterangan"
    t.bigint "periode_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["periode_id"], name: "index_tahuns_on_periode_id"
  end

  create_table "tujuans", force: :cascade do |t|
    t.string "tujuan"
    t.string "tujuanable_type"
    t.bigint "tujuanable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tujuanable_type", "tujuanable_id"], name: "index_tujuans_on_tujuanable"
  end

  create_table "urusans", force: :cascade do |t|
    t.string "urusan"
    t.string "kode_urusan"
    t.string "keterangan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nip", null: false
    t.string "jti", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "api_tokens", "users"
  add_foreign_key "background_migration_jobs", "background_migrations", column: "migration_id", on_delete: :cascade
  add_foreign_key "opds", "lembagas"
  add_foreign_key "periodes", "lembagas"
  add_foreign_key "tahuns", "periodes"
end
