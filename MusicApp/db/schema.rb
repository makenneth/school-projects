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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150508164455) do
=======
ActiveRecord::Schema.define(version: 20160401024649) do
>>>>>>> old_a/master

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "pokemons", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "attack",     null: false
    t.integer  "defense",    null: false
    t.string   "poke_type",  null: false
    t.string   "moves",                   array: true
    t.string   "image_url",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "toys", force: :cascade do |t|
    t.integer  "pokemon_id", null: false
    t.string   "name",       null: false
    t.integer  "price",      null: false
    t.integer  "happiness",  null: false
    t.string   "image_url",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "toys", ["pokemon_id"], name: "index_toys_on_pokemon_id", using: :btree
=======
  create_table "albums", force: :cascade do |t|
    t.integer  "band_id",                       null: false
    t.string   "title",                         null: false
    t.string   "album_type", default: "studio", null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "albums", ["band_id"], name: "index_albums_on_band_id", using: :btree

  create_table "bands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text     "comment",    null: false
    t.integer  "user_id",    null: false
    t.integer  "track_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notes", ["track_id"], name: "index_notes_on_track_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "tracks", force: :cascade do |t|
    t.string   "title"
    t.integer  "album_id",                       null: false
    t.text     "lyrics"
    t.string   "bonus",      default: "regular"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "tracks", ["album_id"], name: "index_tracks_on_album_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                            null: false
    t.string   "password_digest",                  null: false
    t.string   "session_token",                    null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "activated",        default: false
    t.string   "activation_token"
    t.boolean  "admin",            default: false
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree
>>>>>>> old_a/master

end
