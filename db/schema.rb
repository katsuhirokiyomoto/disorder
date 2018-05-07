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

ActiveRecord::Schema.define(version: 20170629070827) do

  create_table "institutionmicroposts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_institutionmicroposts_on_institution_id"
    t.index ["user_id", "institution_id"], name: "index_institutionmicroposts_on_user_id_and_institution_id", unique: true
    t.index ["user_id"], name: "index_institutionmicroposts_on_user_id"
  end

  create_table "institutions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "url"
    t.string "location"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itemrelationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_itemrelationships_on_item_id"
    t.index ["user_id", "item_id"], name: "index_itemrelationships_on_user_id_and_item_id", unique: true
    t.index ["user_id"], name: "index_itemrelationships_on_user_id"
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code"
    t.string "name"
    t.string "url"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "problemmicroposts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "content"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_problemmicroposts_on_user_id"
  end

  create_table "solutions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "problemmicropost_id"
    t.bigint "follower_id"
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id"], name: "index_solutions_on_follower_id"
    t.index ["problemmicropost_id", "follower_id"], name: "index_solutions_on_problemmicropost_id_and_follower_id", unique: true
    t.index ["problemmicropost_id"], name: "index_solutions_on_problemmicropost_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "institutionmicroposts", "institutions"
  add_foreign_key "institutionmicroposts", "users"
  add_foreign_key "itemrelationships", "items"
  add_foreign_key "itemrelationships", "users"
  add_foreign_key "problemmicroposts", "users"
  add_foreign_key "solutions", "problemmicroposts"
  add_foreign_key "solutions", "users", column: "follower_id"
end
