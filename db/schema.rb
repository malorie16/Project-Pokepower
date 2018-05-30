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

ActiveRecord::Schema.define(version: 20180530151534) do

  create_table "pokedexes", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.float   "height"
    t.float   "weight"
    t.integer "type_1"
    t.integer "type_2"
    t.string  "weakness_1"
    t.string  "weakness_2"
    t.integer "catch_rate"
    t.integer "base_hp"
    t.integer "base_attack"
    t.integer "base_defense"
    t.integer "base_sp_attack"
    t.integer "base_sp_defense"
    t.integer "base_speed"
    t.integer "base_experience"
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "pokedex_id"
    t.integer "trainer_id"
    t.integer "team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "pokemon_id_1"
    t.integer "pokemon_id_2"
    t.integer "pokemon_id_3"
    t.integer "pokemon_id_4"
    t.integer "pokemon_id_5"
    t.integer "pokemon_id_6"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.string "hometown"
  end

end
