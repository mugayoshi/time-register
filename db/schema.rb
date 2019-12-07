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

ActiveRecord::Schema.define(version: 20191207044656) do

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "manager_flag",    default: false
    t.integer  "holidays"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "department_id"
    t.integer  "manager_id"
    t.index ["department_id"], name: "index_users_on_department_id", using: :btree
    t.index ["manager_id"], name: "index_users_on_manager_id", using: :btree
  end

  create_table "work_records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "worked_on"
    t.time     "started_at"
    t.time     "ended_at"
    t.integer  "employee_id_id"
    t.integer  "manager_id_id"
    t.boolean  "holiday"
    t.integer  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["employee_id_id"], name: "index_work_records_on_employee_id_id", using: :btree
    t.index ["manager_id_id"], name: "index_work_records_on_manager_id_id", using: :btree
  end

  add_foreign_key "users", "departments"
  add_foreign_key "users", "users", column: "manager_id"
  add_foreign_key "work_records", "users", column: "employee_id_id"
  add_foreign_key "work_records", "users", column: "manager_id_id"
end
