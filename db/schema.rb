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

ActiveRecord::Schema[7.0].define(version: 20_230_514_172_629) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.string 'name', null: false
    t.bigint 'doctor_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['doctor_id'], name: 'index_categories_on_doctor_id'
  end

  create_table 'clients', force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'second_name', null: false
    t.datetime 'birth_date', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'phone_number', null: false
    t.string 'encrypted_password', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['phone_number'], name: 'index_clients_on_phone_number', unique: true
    t.index ['reset_password_token'], name: 'index_clients_on_reset_password_token', unique: true
  end

  create_table 'doctors', force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'second_name', null: false
    t.integer 'work_experience'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'phone_number', null: false
    t.string 'encrypted_password', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['phone_number'], name: 'index_doctors_on_phone_number', unique: true
    t.index ['reset_password_token'], name: 'index_doctors_on_reset_password_token', unique: true
  end

  create_table 'visits', force: :cascade do |t|
    t.datetime 'date_of_visit', null: false
    t.integer 'status', default: 0, null: false
    t.text 'recommendation'
    t.bigint 'doctor_id', null: false
    t.bigint 'client_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['client_id'], name: 'index_visits_on_client_id'
    t.index ['doctor_id'], name: 'index_visits_on_doctor_id'
  end

  add_foreign_key 'categories', 'doctors'
  add_foreign_key 'visits', 'clients'
  add_foreign_key 'visits', 'doctors'
end
