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

ActiveRecord::Schema.define(version: 2019_03_16_130038) do

  create_table "candidate_details", force: :cascade do |t|
    t.decimal "cgpa"
    t.text "experience"
    t.text "about_me"
    t.integer "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_candidate_details_on_candidate_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "affiliation"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "elections", force: :cascade do |t|
    t.string "position"
    t.datetime "deadline"
    t.string "session"
    t.integer "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "election_start"
    t.datetime "election_end"
    t.index ["candidate_id"], name: "index_elections_on_candidate_id"
  end

  create_table "events", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nominations", force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "election_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_nominations_on_candidate_id"
    t.index ["election_id"], name: "index_nominations_on_election_id"
  end

  create_table "user_details", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "branch"
    t.integer "year"
    t.string "roll_number"
    t.string "course"
    t.string "section"
    t.string "email"
    t.boolean "hosteller"
    t.text "address"
    t.boolean "opt_in"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_user_details_on_email", unique: true
    t.index ["user_id"], name: "index_user_details_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "vote_chains", force: :cascade do |t|
    t.integer "election_id"
    t.text "vote_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["election_id"], name: "index_vote_chains_on_election_id"
  end

  create_table "votes", force: :cascade do |t|
    t.string "prev_hash"
    t.integer "data"
    t.string "curr_hash"
    t.integer "vote_chain_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_votes_on_user_id"
    t.index ["vote_chain_id"], name: "index_votes_on_vote_chain_id"
  end

end
