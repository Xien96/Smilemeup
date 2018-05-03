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

ActiveRecord::Schema.define(version: 20180410033851) do

  create_table "pictures", force: :cascade do |t|
    t.string "pic_file_name"
    t.string "pic_content_type"
    t.integer "pic_file_size"
    t.datetime "pic_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

def show
  @products = Products.all
end
  create_table "styles", force: :cascade do |t|
    t.string "name", null: false
    t.string "tagline", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "phone", default: "", null: false
    t.integer "phone_sms", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "candidate_1_file_name"
    t.string "candidate_1_content_type"
    t.integer "candidate_1_file_size"
    t.datetime "candidate_1_updated_at"
    t.string "candidate_2_file_name"
    t.string "candidate_2_content_type"
    t.integer "candidate_2_file_size"
    t.datetime "candidate_2_updated_at"
    t.string "candidate_3_file_name"
    t.string "candidate_3_content_type"
    t.integer "candidate_3_file_size"
    t.datetime "candidate_3_updated_at"
    t.string "candidate_4_file_name"
    t.string "candidate_4_content_type"
    t.integer "candidate_4_file_size"
    t.datetime "candidate_4_updated_at"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
    t.string "city"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
