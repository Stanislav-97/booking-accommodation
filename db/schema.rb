# frozen_string_literal: true

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

ActiveRecord::Schema[7.1].define(version: 20_240_222_150_826) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'bookings', force: :cascade do |t|
    t.bigint 'realty_id', null: false
    t.date 'date_from', null: false
    t.date 'date_to', null: false
    t.float 'amount', null: false
    t.float 'paid_amount', null: false
    t.string 'fio', null: false
    t.string 'phone', null: false
    t.string 'email', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['realty_id'], name: 'index_bookings_on_realty_id'
  end

  create_table 'facilities', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'icon', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'organizations', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'prices', force: :cascade do |t|
    t.float 'amount', null: false
    t.date 'date', null: false
    t.bigint 'realty_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['realty_id'], name: 'index_prices_on_realty_id'
  end

  create_table 'rates', force: :cascade do |t|
    t.bigint 'organization_id', null: false
    t.string 'name', null: false
    t.float 'extra_change', null: false
    t.string 'extra_change_type', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['organization_id'], name: 'index_rates_on_organization_id'
  end

  create_table 'realties', force: :cascade do |t|
    t.bigint 'organization_id', null: false
    t.integer 'building_year', null: false
    t.integer 'floor', null: false
    t.text 'description', null: false
    t.integer 'area', null: false
    t.integer 'entrance'
    t.integer 'rooms_count', null: false
    t.string 'realty_type', null: false
    t.float 'base_price', null: false
    t.float 'lon', null: false
    t.float 'lat', null: false
    t.string 'address', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['organization_id'], name: 'index_realties_on_organization_id'
  end

  create_table 'realties_facilities', force: :cascade do |t|
    t.bigint 'realty_id', null: false
    t.bigint 'facility_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['facility_id'], name: 'index_realties_facilities_on_facility_id'
    t.index ['realty_id'], name: 'index_realties_facilities_on_realty_id'
  end

  create_table 'realties_photos', force: :cascade do |t|
    t.bigint 'realty_id', null: false
    t.string 'photo', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['realty_id'], name: 'index_realties_photos_on_realty_id'
  end

  create_table 'realties_rates', force: :cascade do |t|
    t.bigint 'realty_id', null: false
    t.bigint 'rate_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['rate_id'], name: 'index_realties_rates_on_rate_id'
    t.index ['realty_id'], name: 'index_realties_rates_on_realty_id'
  end

  create_table 'users', force: :cascade do |t|
    t.bigint 'organization_id', null: false
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.boolean 'organization_admin', null: false
    t.string 'email'
    t.string 'phone', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['organization_id'], name: 'index_users_on_organization_id'
  end

  create_table 'users_realties', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'realty_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['realty_id'], name: 'index_users_realties_on_realty_id'
    t.index ['user_id'], name: 'index_users_realties_on_user_id'
  end
end
