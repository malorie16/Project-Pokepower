class Trainer < ActiveRecord::Base
  has_many :teams, through: :pokemons
end
