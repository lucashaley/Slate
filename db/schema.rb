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

ActiveRecord::Schema[7.0].define(version: 2022_03_27_083739) do
  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "idea_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idea_id"], name: "index_bookmarks_on_idea_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "briefs", force: :cascade do |t|
    t.string "title"
    t.string "tagline"
    t.text "overview"
    t.string "url"
    t.text "core_deliverable"
    t.text "supplementary_deliverable"
    t.string "core_criteria_title"
    t.text "core_criteria_body"
    t.string "modeled_after"
    t.string "modeled_after_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "student_number"
    t.integer "idea_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["idea_id"], name: "index_comments_on_idea_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "creatives", force: :cascade do |t|
    t.string "position"
    t.integer "user_id", null: false
    t.integer "pitch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pitch_id"], name: "index_creatives_on_pitch_id"
    t.index ["user_id"], name: "index_creatives_on_user_id"
  end

  create_table "data_migrations", primary_key: "version", id: :string, force: :cascade do |t|
  end

  create_table "favorites", force: :cascade do |t|
    t.string "favoritable_type", null: false
    t.integer "favoritable_id", null: false
    t.string "favoritor_type", null: false
    t.integer "favoritor_id", null: false
    t.string "scope", default: "favorite", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blocked"], name: "index_favorites_on_blocked"
    t.index ["favoritable_id", "favoritable_type"], name: "fk_favoritables"
    t.index ["favoritable_type", "favoritable_id", "favoritor_type", "favoritor_id", "scope"], name: "uniq_favorites__and_favoritables", unique: true
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable"
    t.index ["favoritor_id", "favoritor_type"], name: "fk_favorites"
    t.index ["favoritor_type", "favoritor_id"], name: "index_favorites_on_favoritor"
    t.index ["scope"], name: "index_favorites_on_scope"
  end

  create_table "ideas", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "student_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comments_count"
    t.integer "bookmarks_count"
    t.integer "user_id"
    t.index ["user_id"], name: "index_ideas_on_user_id"
  end

  create_table "ideas_realms", id: false, force: :cascade do |t|
    t.integer "idea_id", null: false
    t.integer "realm_id", null: false
  end

  create_table "pitches", force: :cascade do |t|
    t.string "title"
    t.string "tagline"
    t.string "logline"
    t.text "synopsis"
    t.string "slides"
    t.datetime "presentation_datetime"
    t.integer "user_id", null: false
    t.integer "idea_id", null: false
    t.integer "brief_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brief_id"], name: "index_pitches_on_brief_id"
    t.index ["idea_id"], name: "index_pitches_on_idea_id"
    t.index ["user_id"], name: "index_pitches_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "impact"
    t.integer "viability"
    t.integer "student_number"
    t.integer "idea_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["idea_id"], name: "index_ratings_on_idea_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "realms", force: :cascade do |t|
    t.string "title"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "title"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "student_number"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comments_count"
    t.integer "ideas_count"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "bookmarks", "ideas"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "comments", "ideas"
  add_foreign_key "comments", "users"
  add_foreign_key "creatives", "pitches"
  add_foreign_key "creatives", "users"
  add_foreign_key "ideas", "users"
  add_foreign_key "pitches", "briefs"
  add_foreign_key "pitches", "ideas"
  add_foreign_key "pitches", "users"
  add_foreign_key "ratings", "ideas"
  add_foreign_key "ratings", "users"
end
