class CreateTeam < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.integer :pokemon_id_1
      t.integer :pokemon_id_2
      t.integer :pokemon_id_3
      t.integer :pokemon_id_4
      t.integer :pokemon_id_5
      t.integer :pokemon_id_6
    end
  end
end
