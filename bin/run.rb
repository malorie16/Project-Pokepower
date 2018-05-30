require_relative '../config/environment'
require_all 'app'
require 'pry'

new_cli = CommandLineInterface.new
#new_cli.run

new_cli.test
binding.pry

pikachu = Pokedex.new(name: "pikachu", description: "blah")
pikachu.save
ponyta = Pokedex.new(name: "ponyta")
ponyta.save
magneton = Pokedex.new(name: "magneton")
magneton.save
slowpoke = Pokedex.new(name: "slowpoke")
slowpoke.save
dodrio = Pokedex.new(name: "dodrio")
dodrio.save
machamp = Pokedex.new(name: "machamp")
machamp.save
gastly = Pokedex.new(name: "Gastly")
gastly.save
voltorb = Pokedex.new(name: "Voltorb")
voltorb.save
krabby = Pokedex.new(name: "Krabby")
krabby.save
cubone = Pokedex.new(name: "Cubone")
cubone.save
hypno = Pokedex.new(name: "Hypno")
hypno.save


ash = Trainer.new(name: "Ash Ketchum")
ash.save
aisatou = Trainer.new(name: "Aisatou Diallo")
aisatou.save
malorie = Trainer.new(name: "Malorie Casimir")
malorie.save
paul = Trainer.new(name: "Paul Ly")
paul.save

ash_team1 = Team.new(pokemon_id_1: hypno.id, pokemon_id_2: pikachu.id, pokemon_id_3: magneton, pokemon_id_4: cubone, pokemon_id_5: slowpoke, pokemon_id_6: gastly)
ash_team1.save
aisatou_team1 = Team.new(pokemon_id_1: ponyta, pokemon_id_2: dodrio, pokemon_id_3: machamp, pokemon_id_4: hypno, pokemon_id_5: pikachu, pokemon_id_6: ponyta)
aisatou_team1.save
malorie_team1 = Team.new(pokemon_id_1: ponyta, pokemon_id_2: 5, pokemon_id_3: 6, pokemon_id_4: 8, pokemon_id_5: 9, pokemon_id_6: 2)
malorie_team1.save
paul_team1 = Team.new(pokemon_id_1: 8, pokemon_id_2: 3, pokemon_id_3: 2, pokemon_id_4: 1, pokemon_id_5: 2, pokemon_id_6: 10)
paul_team1.save

poke_entry1 = Pokemon.new(pokedex_id: 1, trainer_id: 1, team_id: 1)
poke_entry1.save
poke_entry2 = Pokemon.new(pokedex_id: 2, trainer_id: 2, team_id: 2)
poke_entry2.save
poke_entry3 = Pokemon.new(pokedex_id: 3, trainer_id: 3, team_id: 3)
poke_entry3.save
poke_entry4 = Pokemon.new(pokedex_id: 4, trainer_id: 4, team_id: 4)
poke_entry4.save
