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

ActiveRecord::Schema[7.1].define(version: 2024_01_08_004848) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anggarans", force: :cascade do |t|
    t.string "kode"
    t.text "uraian"
    t.decimal "total", default: "0.0"
    t.integer "tahun"
    t.string "keterangan"
    t.string "anggaranable_type"
    t.bigint "anggaranable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anggaranable_type", "anggaranable_id"], name: "index_anggarans_on_anggaranable"
  end

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

  create_table "kelompok_anggarans", force: :cascade do |t|
    t.string "nama_kelompok"
    t.string "keterangan"
    t.bigint "lembaga_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lembaga_id"], name: "index_kelompok_anggarans_on_lembaga_id"
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

  create_table "pohons", force: :cascade do |t|
    t.string "role"
    t.string "pohonable_type"
    t.bigint "pohonable_id"
    t.string "keterangan"
    t.integer "level", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_id"
    t.bigint "tahun_id"
    t.index ["parent_id"], name: "index_pohons_on_parent_id"
    t.index ["pohonable_type", "pohonable_id"], name: "index_pohons_on_pohonable"
    t.index ["tahun_id"], name: "index_pohons_on_tahun_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "nama", null: false
    t.bigint "user_id", null: false
    t.boolean "aktif", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "opd_id"
    t.index ["opd_id"], name: "index_profiles_on_opd_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "program"
    t.string "kode_program"
    t.string "keterangan"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strategics", force: :cascade do |t|
    t.string "strategi"
    t.string "keterangan"
    t.boolean "from_kota", default: true
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "opd_id"
    t.bigint "tahun_id"
    t.index ["opd_id"], name: "index_strategics_on_opd_id"
    t.index ["parent_id"], name: "index_strategics_on_parent_id"
    t.index ["tahun_id"], name: "index_strategics_on_tahun_id"
  end

  create_table "subkegiatans", force: :cascade do |t|
    t.string "subkegiatan"
    t.string "kode_subkegiatan"
    t.string "keterangan"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tahuns", force: :cascade do |t|
    t.integer "tahun"
    t.string "keterangan"
    t.bigint "periode_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "kelompok_anggaran_id"
    t.index ["kelompok_anggaran_id"], name: "index_tahuns_on_kelompok_anggaran_id"
    t.index ["periode_id"], name: "index_tahuns_on_periode_id"
  end

  create_table "targets", force: :cascade do |t|
    t.decimal "target"
    t.string "satuan"
    t.integer "tahun"
    t.string "versi"
    t.string "keterangan"
    t.string "targetable_type"
    t.bigint "targetable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["targetable_type", "targetable_id"], name: "index_targets_on_targetable"
  end

  create_table "tematiks", force: :cascade do |t|
    t.string "tematik"
    t.string "keterangan"
    t.bigint "tahun_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_id"
    t.string "jenis"
    t.integer "level", default: 0
    t.index ["parent_id"], name: "index_tematiks_on_parent_id"
    t.index ["tahun_id"], name: "index_tematiks_on_tahun_id"
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
  add_foreign_key "kelompok_anggarans", "lembagas"
  add_foreign_key "opds", "lembagas"
  add_foreign_key "periodes", "lembagas"
  add_foreign_key "pohons", "pohons", column: "parent_id"
  add_foreign_key "profiles", "users"
  add_foreign_key "strategics", "strategics", column: "parent_id"
  add_foreign_key "tahuns", "periodes"
  add_foreign_key "tematiks", "tahuns"
  add_foreign_key "tematiks", "tematiks", column: "parent_id"
end
