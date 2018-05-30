class Pokedex < ActiveRecord::Base
  has_many :pokemons
end
