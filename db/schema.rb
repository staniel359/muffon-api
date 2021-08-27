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

ActiveRecord::Schema.define(version: 2021_08_27_113143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.bigint "artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "listeners_count"
    t.index ["artist_id"], name: "index_albums_on_artist_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_url"
    t.integer "listeners_count"
  end

  create_table "profile_albums", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "album_id", null: false
    t.bigint "profile_artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_url"
    t.integer "profile_tracks_count", default: 0
    t.index ["album_id"], name: "index_profile_albums_on_album_id"
    t.index ["profile_artist_id"], name: "index_profile_albums_on_profile_artist_id"
    t.index ["profile_id"], name: "index_profile_albums_on_profile_id"
  end

  create_table "profile_artists", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "profile_tracks_count", default: 0
    t.integer "profile_albums_count", default: 0
    t.index ["artist_id"], name: "index_profile_artists_on_artist_id"
    t.index ["profile_id"], name: "index_profile_artists_on_profile_id"
  end

  create_table "profile_tracks", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "track_id", null: false
    t.bigint "profile_artist_id", null: false
    t.bigint "profile_album_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_album_id"], name: "index_profile_tracks_on_profile_album_id"
    t.index ["profile_artist_id"], name: "index_profile_tracks_on_profile_artist_id"
    t.index ["profile_id"], name: "index_profile_tracks_on_profile_id"
    t.index ["track_id"], name: "index_profile_tracks_on_track_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "email"
    t.string "token"
    t.string "password_digest"
    t.string "nickname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "gender"
    t.string "birthdate"
    t.string "country"
    t.string "city"
  end

  create_table "recommendations", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.integer "artist_id"
    t.integer "profile_artist_ids", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_recommendations_on_profile_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "title"
    t.bigint "artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "player_id"
    t.index ["artist_id"], name: "index_tracks_on_artist_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "albums", "artists"
  add_foreign_key "profile_albums", "albums"
  add_foreign_key "profile_albums", "profile_artists"
  add_foreign_key "profile_albums", "profiles"
  add_foreign_key "profile_artists", "artists"
  add_foreign_key "profile_artists", "profiles"
  add_foreign_key "profile_tracks", "profile_albums"
  add_foreign_key "profile_tracks", "profile_artists"
  add_foreign_key "profile_tracks", "profiles"
  add_foreign_key "profile_tracks", "tracks"
  add_foreign_key "recommendations", "profiles"
  add_foreign_key "tracks", "artists"
end
