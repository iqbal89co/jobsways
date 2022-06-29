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

ActiveRecord::Schema[7.0].define(version: 2022_06_25_104149) do
  create_table "company_data", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "location"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "company_datum_id"
    t.string "title"
    t.string "position"
    t.float "salary"
    t.float "salary_upto"
    t.string "location"
    t.string "job_type"
    t.string "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_datum_id"], name: "index_jobs_on_company_datum_id"
  end

  create_table "user_data", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "contact"
    t.date "birth_date"
    t.string "nationality"
    t.string "resume"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "jobs", "company_data"
end
