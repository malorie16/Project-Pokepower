Trainer.destroy_all
ash = Trainer.create(name: "Ash Ketchum", hometown: "Pallet Town")
aisatou = Trainer.create(name: "Aisatou Diallo", hometown: "Boogie Down Bronx")
malorie = Trainer.create(name: "Malorie Casimir", hometown: "Brooklyn")
paul = Trainer.create(name: "Paul Ly", hometown: "Brooklyn")

Pokemon.destroy_all
pikachu = Pokemon.create(name: "Pikachu", description: "blah")
ponyta = Pokemon.create(name: "Ponyta", description: "blah")

Pokeball.destroy_all
poke_entry1 = Pokeball.create(pokemon_id: 1, trainer_id: 1)
poke_entry2 = Pokeball.create(pokemon_id: 2, trainer_id: 2)
poke_entry3 = Pokeball.create(pokemon_id: 3, trainer_id: 3)
poke_entry4 = Pokeball.create(pokemon_id: 4, trainer_id: 4)

# magneton = Pokemon.new(name: "Magneton", description: "blah", height: , weight: , type_1: , type_2: , weakness_1: , weakness_2: , catch_rate: , base_hp: , base_attack: , base_defense: , base_sp_attack: , base_sp_defense: , base_speed: , :base_experience)
# slowpoke = Pokemon.new(name: "Slowpoke", description: "blah", height: , weight: , type_1: , type_2: , weakness_1: , weakness_2: , catch_rate: , base_hp: , base_attack: , base_defense: , base_sp_attack: , base_sp_defense: , base_speed: , :base_experience)
# dodrio = Pokemon.new(name: "Dodrio", description: "blah", height: , weight: , type_1: , type_2: , weakness_1: , weakness_2: , catch_rate: , base_hp: , base_attack: , base_defense: , base_sp_attack: , base_sp_defense: , base_speed: , :base_experience)
# machamp = Pokemon.new(name: "Machamp", description: "blah", height: , weight: , type_1: , type_2: , weakness_1: , weakness_2: , catch_rate: , base_hp: , base_attack: , base_defense: , base_sp_attack: , base_sp_defense: , base_speed: , :base_experience)
# gastly = Pokemon.new(name: "Gastly", description: "blah", height: , weight: , type_1: , type_2: , weakness_1: , weakness_2: , catch_rate: , base_hp: , base_attack: , base_defense: , base_sp_attack: , base_sp_defense: , base_speed: , :base_experience)
# voltorb = Pokemon.new(name: "Voltorb", description: "blah", height: , weight: , type_1: , type_2: , weakness_1: , weakness_2: , catch_rate: , base_hp: , base_attack: , base_defense: , base_sp_attack: , base_sp_defense: , base_speed: , :base_experience)
# krabby = Pokemon.new(name: "Krabby", description: "blah", height: , weight: , type_1: , type_2: , weakness_1: , weakness_2: , catch_rate: , base_hp: , base_attack: , base_defense: , base_sp_attack: , base_sp_defense: , base_speed: , :base_experience)
# cubone = Pokemon.new(name: "Cubone", description: "blah", height: , weight: , type_1: , type_2: , weakness_1: , weakness_2: , catch_rate: , base_hp: , base_attack: , base_defense: , base_sp_attack: , base_sp_defense: , base_speed: , :base_experience)
# hypno = Pokemon.new(name: "Hypno", description: "blah", height: , weight: , type_1: , type_2: , weakness_1: , weakness_2: , catch_rate: , base_hp: , base_attack: , base_defense: , base_sp_attack: , base_sp_defense: , base_speed: , :base_experience)

# ash_team1 = Team.new(pokemon_id_1: hypno.id, pokemon_id_2: pikachu.id, pokemon_id_3: magneton, pokemon_id_4: cubone, pokemon_id_5: slowpoke, pokemon_id_6: gastly)
# aisatou_team1 = Team.new(pokemon_id_1: ponyta, pokemon_id_2: dodrio, pokemon_id_3: machamp, pokemon_id_4: hypno, pokemon_id_5: pikachu, pokemon_id_6: ponyta)
# malorie_team1 = Team.new(pokemon_id_1: ponyta, pokemon_id_2: 5, pokemon_id_3: 6, pokemon_id_4: 8, pokemon_id_5: 9, pokemon_id_6: 2)
# paul_team1 = Team.new(pokemon_id_1: 8, pokemon_id_2: 3, pokemon_id_3: 2, pokemon_id_4: 1, pokemon_id_5: 2, pokemon_id_6: 10)
