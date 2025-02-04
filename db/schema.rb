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

ActiveRecord::Schema.define(version: 2021_06_23_152913) do

  create_table "exercises", force: :cascade do |t|
    t.string "name", null: false
    t.integer "workout_id"
    t.string "sets"
    t.string "reps"
    t.string "duration"
    t.string "calories_burned"
    t.string "weight"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "age"
    t.string "height"
    t.string "weight"
    t.string "bodyfat"
    t.string "password"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name", null: false
    t.string "body_part"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
