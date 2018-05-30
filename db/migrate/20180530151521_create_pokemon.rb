class CreatePokemon < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.integer :pokedex_id
      t.integer :trainer_id
      t.integer :team_id
    end
  end
end
