class Team < ActiveRecord::Base
  has_many :trainers, through: :pokemons
end
