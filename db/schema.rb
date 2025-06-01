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

ActiveRecord::Schema[8.0].define(version: 2025_06_01_075029) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
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
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "listeners_count"
    t.string "title_downcase"
    t.index ["artist_id", "title_downcase"], name: "index_albums_on_artist_id_and_title_downcase", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "listeners_count"
    t.integer "tag_ids", default: [], array: true
    t.string "name_downcase"
    t.string "image_url"
    t.index ["name_downcase"], name: "index_artists_on_name_downcase", unique: true
  end

  create_table "bookmark_albums", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.integer "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "source_data"
    t.index ["album_id", "profile_id"], name: "index_bookmark_albums_on_album_id_and_profile_id", unique: true
    t.index ["profile_id"], name: "index_bookmark_albums_on_profile_id"
  end

  create_table "bookmark_artists", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.integer "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id", "profile_id"], name: "index_bookmark_artists_on_artist_id_and_profile_id", unique: true
    t.index ["profile_id"], name: "index_bookmark_artists_on_profile_id"
  end

  create_table "bookmark_tracks", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.integer "track_id"
    t.integer "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "source_data"
    t.jsonb "audio_data"
    t.jsonb "album_source_data"
    t.index ["profile_id"], name: "index_bookmark_tracks_on_profile_id"
    t.index ["track_id", "profile_id"], name: "index_bookmark_tracks_on_track_id_and_profile_id", unique: true
  end

  create_table "bookmark_video_channels", force: :cascade do |t|
    t.bigint "video_channel_id", null: false
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_bookmark_video_channels_on_profile_id"
    t.index ["video_channel_id", "profile_id"], name: "index_bookmark_video_channels_on_video_channel_and_profile", unique: true
  end

  create_table "bookmark_video_playlists", force: :cascade do |t|
    t.bigint "video_playlist_id", null: false
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_bookmark_video_playlists_on_profile_id"
    t.index ["video_playlist_id", "profile_id"], name: "index_bookmark_video_playlists_on_video_playlist_and_profile", unique: true
  end

  create_table "bookmark_videos", force: :cascade do |t|
    t.bigint "video_id", null: false
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_bookmark_videos_on_profile_id"
    t.index ["video_id", "profile_id"], name: "index_bookmark_videos_on_video_id_and_profile_id", unique: true
  end

  create_table "browser_events", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_browser_events_on_profile_id"
  end

  create_table "communities", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.string "title"
    t.text "description"
    t.integer "members_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_communities_on_profile_id"
    t.index ["title"], name: "index_communities_on_title", unique: true
  end

  create_table "conversations", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "other_profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id", "other_profile_id"], name: "index_conversations_on_profile_id_and_other_profile_id", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "eventable_type"
    t.bigint "eventable_id"
    t.bigint "profile_id", null: false
    t.bigint "other_profile_id"
    t.integer "event_type", null: false
    t.jsonb "eventable_data"
    t.jsonb "updated_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eventable_type", "eventable_id"], name: "index_events_on_eventable"
    t.index ["other_profile_id"], name: "index_events_on_other_profile_id"
    t.index ["profile_id"], name: "index_events_on_profile_id"
  end

  create_table "favorite_albums", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.integer "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "source_data"
    t.index ["album_id", "profile_id"], name: "index_favorite_albums_on_album_id_and_profile_id", unique: true
    t.index ["profile_id"], name: "index_favorite_albums_on_profile_id"
  end

  create_table "favorite_artists", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.integer "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id", "profile_id"], name: "index_favorite_artists_on_artist_id_and_profile_id", unique: true
    t.index ["profile_id"], name: "index_favorite_artists_on_profile_id"
  end

  create_table "favorite_tracks", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.integer "track_id"
    t.integer "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "source_data"
    t.jsonb "audio_data"
    t.jsonb "album_source_data"
    t.index ["profile_id"], name: "index_favorite_tracks_on_profile_id"
    t.index ["track_id", "profile_id"], name: "index_favorite_tracks_on_track_id_and_profile_id", unique: true
  end

  create_table "favorite_videos", force: :cascade do |t|
    t.bigint "video_id", null: false
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_favorite_videos_on_profile_id"
    t.index ["video_id", "profile_id"], name: "index_favorite_videos_on_video_id_and_profile_id", unique: true
  end

  create_table "lastfm_connections", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.string "nickname"
    t.string "session_key"
    t.string "image_url"
    t.boolean "premium", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_lastfm_connections_on_profile_id"
  end

  create_table "library_albums", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "album_id", null: false
    t.bigint "library_artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "library_tracks_count", default: 0
    t.jsonb "source_data"
    t.index ["album_id", "profile_id"], name: "index_library_albums_on_album_id_and_profile_id", unique: true
    t.index ["library_artist_id"], name: "index_library_albums_on_library_artist_id"
    t.index ["profile_id"], name: "index_library_albums_on_profile_id"
  end

  create_table "library_artists", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "library_tracks_count", default: 0
    t.integer "library_albums_count", default: 0
    t.index ["artist_id", "profile_id"], name: "index_library_artists_on_artist_id_and_profile_id", unique: true
    t.index ["profile_id"], name: "index_library_artists_on_profile_id"
  end

  create_table "library_tracks", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "track_id", null: false
    t.bigint "library_artist_id", null: false
    t.bigint "library_album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "source_data"
    t.jsonb "audio_data"
    t.jsonb "album_source_data"
    t.index ["library_album_id"], name: "index_library_tracks_on_library_album_id"
    t.index ["library_artist_id"], name: "index_library_tracks_on_library_artist_id"
    t.index ["profile_id"], name: "index_library_tracks_on_profile_id"
    t.index ["track_id"], name: "index_library_tracks_on_track_id"
  end

  create_table "listened_albums", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.integer "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id", "profile_id"], name: "index_listened_albums_on_album_id_and_profile_id", unique: true
    t.index ["profile_id"], name: "index_listened_albums_on_profile_id"
  end

  create_table "listened_artists", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.integer "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id", "profile_id"], name: "index_listened_artists_on_artist_id_and_profile_id", unique: true
    t.index ["profile_id"], name: "index_listened_artists_on_profile_id"
  end

  create_table "listened_tracks", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.integer "track_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_listened_tracks_on_profile_id"
    t.index ["track_id", "profile_id"], name: "index_listened_tracks_on_track_id_and_profile_id", unique: true
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "community_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id", "profile_id"], name: "index_memberships_on_community_id_and_profile_id", unique: true
    t.index ["profile_id"], name: "index_memberships_on_profile_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "conversation_id", null: false
    t.bigint "profile_id", null: false
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "tracks", default: [], array: true
    t.jsonb "albums", default: [], array: true
    t.jsonb "artists", default: [], array: true
    t.jsonb "playlists", default: [], array: true
    t.jsonb "communities", default: [], array: true
    t.jsonb "videos", default: [], array: true
    t.jsonb "video_playlists", default: [], array: true
    t.jsonb "video_channels", default: [], array: true
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "playing_events", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_playing_events_on_profile_id"
  end

  create_table "playlist_tracks", force: :cascade do |t|
    t.bigint "playlist_id", null: false
    t.integer "track_id"
    t.integer "artist_id"
    t.integer "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "source_data"
    t.jsonb "audio_data"
    t.jsonb "album_source_data"
    t.index ["playlist_id"], name: "index_playlist_tracks_on_playlist_id"
    t.index ["track_id", "playlist_id"], name: "index_playlist_tracks_on_track_id_and_playlist_id", unique: true
  end

  create_table "playlists", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.string "title"
    t.integer "tracks_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private", default: false
    t.text "description"
    t.index ["profile_id"], name: "index_playlists_on_profile_id"
    t.index ["title", "profile_id"], name: "index_playlists_on_title_and_profile_id", unique: true
  end

  create_table "post_comments", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "profile_id", null: false
    t.boolean "by_community", default: false
    t.bigint "community_id"
    t.text "text"
    t.jsonb "tracks", default: [], array: true
    t.jsonb "albums", default: [], array: true
    t.jsonb "artists", default: [], array: true
    t.jsonb "playlists", default: [], array: true
    t.jsonb "communities", default: [], array: true
    t.jsonb "videos", default: [], array: true
    t.jsonb "video_playlists", default: [], array: true
    t.jsonb "video_channels", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_post_comments_on_community_id"
    t.index ["post_id"], name: "index_post_comments_on_post_id"
    t.index ["profile_id"], name: "index_post_comments_on_profile_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "other_profile_id"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "community_id"
    t.boolean "by_community", default: false
    t.integer "post_type"
    t.jsonb "tracks", default: [], array: true
    t.jsonb "albums", default: [], array: true
    t.jsonb "artists", default: [], array: true
    t.jsonb "playlists", default: [], array: true
    t.jsonb "communities", default: [], array: true
    t.jsonb "videos", default: [], array: true
    t.jsonb "video_playlists", default: [], array: true
    t.jsonb "video_channels", default: [], array: true
    t.index ["community_id"], name: "index_posts_on_community_id"
    t.index ["other_profile_id"], name: "index_posts_on_other_profile_id"
    t.index ["profile_id"], name: "index_posts_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "email"
    t.string "token"
    t.string "password_digest"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gender"
    t.string "birthdate"
    t.string "country"
    t.string "city"
    t.integer "role", default: 0
    t.integer "following_count", default: 0
    t.integer "followers_count", default: 0
    t.boolean "online", default: false
    t.integer "password_reset_code"
    t.datetime "was_online_at"
    t.jsonb "playing"
    t.boolean "private", default: false
    t.integer "library_artists_count", default: 0
    t.integer "library_albums_count", default: 0
    t.integer "library_tracks_count", default: 0
    t.text "status"
    t.boolean "save_activity_history", default: true
    t.index ["email"], name: "index_profiles_on_email", unique: true
    t.index ["nickname"], name: "index_profiles_on_nickname", unique: true
    t.index ["token"], name: "index_profiles_on_token"
  end

  create_table "recommendation_artists", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "artist_id", null: false
    t.integer "library_artist_ids", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "deleted", default: false
    t.index ["profile_id", "artist_id"], name: "index_recommendation_artists_on_profile_id_and_artist_id", unique: true
  end

  create_table "recommendation_tracks", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "track_id", null: false
    t.integer "library_track_ids", default: [], array: true
    t.boolean "deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id", "track_id"], name: "index_recommendation_tracks_on_profile_id_and_track_id", unique: true
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "other_profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["other_profile_id"], name: "index_relationships_on_other_profile_id"
    t.index ["profile_id", "other_profile_id"], name: "index_relationships_on_profile_id_and_other_profile_id", unique: true
  end

  create_table "spotify_connections", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.string "spotify_id"
    t.string "nickname"
    t.string "image_url"
    t.boolean "premium", default: false
    t.string "access_token"
    t.string "refresh_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "client_id"
    t.string "client_secret"
    t.index ["profile_id"], name: "index_spotify_connections_on_profile_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name_downcase"
    t.index ["name_downcase"], name: "index_tags_on_name_downcase", unique: true
  end

  create_table "tracks", force: :cascade do |t|
    t.string "title"
    t.bigint "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "player_id"
    t.string "title_downcase"
    t.index ["artist_id", "title_downcase"], name: "index_tracks_on_artist_id_and_title_downcase", unique: true
    t.index ["player_id"], name: "index_tracks_on_player_id", unique: true
  end

  create_table "video_channels", force: :cascade do |t|
    t.string "youtube_id"
    t.string "title"
    t.integer "videos_count", default: 0
    t.integer "subscribers_count", default: 0
    t.bigint "views_count", default: 0
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "video_playlists", force: :cascade do |t|
    t.string "youtube_id"
    t.string "title"
    t.string "channel_youtube_id"
    t.string "channel_title"
    t.text "description"
    t.integer "videos_count", default: 0
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["youtube_id", "channel_youtube_id"], name: "index_video_playlists_on_youtube_id_and_channel_youtube_id", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "youtube_id"
    t.string "title"
    t.string "channel_youtube_id"
    t.string "channel_title"
    t.bigint "views_count", default: 0
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["youtube_id", "channel_youtube_id"], name: "index_videos_on_youtube_id_and_channel_youtube_id", unique: true
  end

  create_table "watched_videos", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "video_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_watched_videos_on_profile_id"
    t.index ["video_id", "profile_id"], name: "index_watched_videos_on_video_id_and_profile_id", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookmark_albums", "profiles"
  add_foreign_key "bookmark_artists", "profiles"
  add_foreign_key "bookmark_tracks", "profiles"
  add_foreign_key "bookmark_video_channels", "profiles"
  add_foreign_key "bookmark_video_channels", "video_channels"
  add_foreign_key "bookmark_video_playlists", "profiles"
  add_foreign_key "bookmark_video_playlists", "video_playlists"
  add_foreign_key "bookmark_videos", "profiles"
  add_foreign_key "bookmark_videos", "videos"
  add_foreign_key "browser_events", "profiles"
  add_foreign_key "communities", "profiles"
  add_foreign_key "conversations", "profiles"
  add_foreign_key "conversations", "profiles", column: "other_profile_id"
  add_foreign_key "events", "profiles"
  add_foreign_key "events", "profiles", column: "other_profile_id"
  add_foreign_key "favorite_albums", "profiles"
  add_foreign_key "favorite_artists", "profiles"
  add_foreign_key "favorite_tracks", "profiles"
  add_foreign_key "favorite_videos", "profiles"
  add_foreign_key "favorite_videos", "videos"
  add_foreign_key "lastfm_connections", "profiles"
  add_foreign_key "library_albums", "library_artists"
  add_foreign_key "library_albums", "profiles"
  add_foreign_key "library_artists", "profiles"
  add_foreign_key "library_tracks", "library_albums"
  add_foreign_key "library_tracks", "library_artists"
  add_foreign_key "library_tracks", "profiles"
  add_foreign_key "listened_albums", "profiles"
  add_foreign_key "listened_artists", "profiles"
  add_foreign_key "listened_tracks", "profiles"
  add_foreign_key "memberships", "communities"
  add_foreign_key "memberships", "profiles"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "profiles"
  add_foreign_key "playing_events", "profiles"
  add_foreign_key "playlist_tracks", "playlists"
  add_foreign_key "playlists", "profiles"
  add_foreign_key "post_comments", "communities"
  add_foreign_key "post_comments", "posts"
  add_foreign_key "post_comments", "profiles"
  add_foreign_key "posts", "communities"
  add_foreign_key "posts", "profiles"
  add_foreign_key "posts", "profiles", column: "other_profile_id"
  add_foreign_key "recommendation_artists", "artists"
  add_foreign_key "recommendation_artists", "profiles"
  add_foreign_key "recommendation_tracks", "profiles"
  add_foreign_key "recommendation_tracks", "tracks"
  add_foreign_key "relationships", "profiles"
  add_foreign_key "relationships", "profiles", column: "other_profile_id"
  add_foreign_key "spotify_connections", "profiles"
  add_foreign_key "watched_videos", "profiles"
  add_foreign_key "watched_videos", "videos"
end
