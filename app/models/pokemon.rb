class Pokemon < ActiveRecord::Base
  belongs_to :trainers
  belongs_to :teams
  belongs_to :pokedex
end
