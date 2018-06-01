class CommandLineInterface

=begin_________________________
      PROGRAM BOOT / #run
      system("afplay Pokemon_Theme_Song.mp3")
      system("afplay Desktop/Pokemon_Theme_Song.mp3")
      1. greeting
      2. get_username
      3. verify_username
      4. gauge_visitor / create_new_user - only if user isn't in db (by name)
      5. show_menu

      VIEW TEAM
      1. view_team - connected view_team_stats in case trainer is interested
      2. menu

      ADD POKEMON
      1.
      2.

      SET FREE
      1. set_pokemon_free - checks for available pokemon to remove
      2. delete_pokemon - setup and helper method
      3. db_remove_pokemon - actual delete method

      VIEW STATS
      view_stats

      EXIT
      1. until '5' is entered when menu is open, allow all other functionality
      AKA leaves program when '5' is entered in the menu
=end

  def greeting # num1 in #run
    message = <<-MESSAGE
    **********************************************************************
    *              "Welcome to Straight Outta Terminal's"                *
    *                      "Module 1 Project"                            *
    *                       "By yours truly"                             *
    *                    "Aisatou, Malorie, Paul"                        *
    **********************************************************************
    MESSAGE
    puts message
  end

  def verify_username(user_input)
    puts "So you're #{user_input.capitalize}?"
    puts "Y or N"
    user_input = gets.chomp
  end

  def create_new_user(user_input)
    system("clear")
    puts "Welcome #{user_input.capitalize}! Where are you from?"
    user_location = gets.chomp
    new_trainer = Trainer.create(name: user_input.capitalize, hometown: user_location.capitalize)
    system("clear")
    puts "That's dope. How's the weather in #{user_location.capitalize}? Are you ready to start your adventure?"
    sleep(0.5)
  end

  def gauge_visitor(user_input)
    sleep(0.3)
    if returning_trainer = Trainer.find_by(name: user_input.capitalize)
      system("clear")
      puts "Welcome back, #{returning_trainer.name}!"
      # system "say 'Welcome back, #{returning_trainer.name}!'"
    else
      user = create_new_user(user_input)
    end
  end

  def get_username
    puts "What's your nickname?"
    user_input = gets.chomp
    result = verify_username(user_input).upcase
    if result == "Y"
      puts "What a lovely name!"
      sleep(0.3)
      puts "Menu loading..."
      gauge_visitor(user_input)
    elsif result == "N"
      get_username
    end
  end

  def menu
    the_menu = <<-MENU
    Pick a number to get started! 👻
    1. View Team
    2. Add Pokemon to team
    3. Set pokemon free
    4. View Pokestats
    5. Exit
    MENU
  end

  def show_menu(user) # num2 in #run
    puts menu
    user_input = gets.chomp.to_i
    until user_input == 5
      case user_input
      when 1
        view_team(user, "yes")
        break
      # when 2
      #   add_pokemon_to_team
      #   break
      when 3
        set_pokemon_free(user)
        break
      when 4
        view_stats(user)
        break
      else
        puts "Whaddya doing? Try again"
        show_menu(user)
        break
      end
    end
  end

  def get_own_team(user, purpose)
    if purpose == "names"                     #for #view_team
      team = user.pokemons.map do |pokemon|
        pokemon.name
      end
      team
    elsif purpose == "team"                    #for #remove method
      team = user.pokemons
    end
  end

  def view_team(user, stats)                #NEED TO RELOAD DATA AFTER DELETION
    team = get_own_team(user, "names")
    system("clear")
    counter = 0
     team.each do |poke|
       puts "#{counter += 1}. #{poke}"
     end
     stats == "yes" ? view_team_stats(user) : nil
  end

  def stats_table(pokemon)
    stats = <<-STATS
    _____________________________________________________________________
    | Name: #{pokemon.name}
    | Description: #{pokemon.description}
    | Height: #{pokemon.height}
    | Weight: #{pokemon.weight}
    | Type 1: #{pokemon.type_1}
    | Type 2: #{pokemon.type_2}
    | Weakness 1: #{pokemon.weakness_1}
    | Weakness 2: #{pokemon.weakness_2}
    | Catch Rate: #{pokemon.catch_rate}
    | Base HP: #{pokemon.base_hp}
    | Base Attack: #{pokemon.base_attack}
    | Base Defense: #{pokemon.base_defense}
    | Base Sp Attack: #{pokemon.base_sp_attack}
    | Base Sp Defense: #{pokemon.base_sp_defense}
    | Base Speed: #{pokemon.base_speed}
    | Base Exp: #{pokemon.base_experience}
    |____________________________________________________________________
    STATS
    stats
  end

  def view_team_stats(trainer)
    #for specific user's team
    puts "Would you like to see these guys' stats? (Y or N)"
    user_input = gets.chomp
    if user_input.upcase == "Y"
      system("clear")
      puts "Get ready for your dream team's stats!"
      trainer.pokemons.each do |pokemon|
        puts stats_table(pokemon)
      end
    elsif user_input.upcase == "N"
    else
      puts "'Y or N' for Mewtwo's sake!"
    end
    show_menu(trainer)
  end

  def view_stats(trainer)
    #for submenu
    puts "Which Pokemon's stats does yee heart desire?"
    puts "Enter this Pokemon's name when you're ready!"
    user_input = gets.chomp.capitalize
    found_pokemon = Pokemon.all.find_by(name: user_input)
    system("clear")
    puts stats_table(found_pokemon)
    show_menu(trainer)
  end


  def add_pokemon_to_team
    #adds pokemon to team
    #player can only have 6 teams
    #malorie
  end


  def set_pokemon_free(user)
      #takes pokemon off team
    users_team = get_own_team(user, "names")
    if users_team.size >= 1
      users_team = view_team(user, "no")  #no refers to don't show team's pokemon's stats
      puts "Which Pokemon do you wanna remove, playa?"
      delete_pokemon(user, users_team)
    elsif users_team.size <= 0
      "Oh no! You're too weak to have any pokemon. You, #{user}, don't have any!!"
    end
    show_menu(user)
   end

   def db_remove_pokemon(user, pokemon)
     puts "You DEADASS tryna delete #{pokemon.name}???? (Y or N)"
     # system("say 'You DEADASS tryna delete #{delete_pokemon.name}????'")
     user_input = gets.chomp.upcase
     if user_input == "Y"
       deleted_pokemon = nil
       user.pokeballs.each do |pokeball|
         if pokeball.pokemon_id == pokemon.id && pokeball.trainer_id == user.id
           deleted_pokemon = user.pokeballs.delete(pokeball.id)
         end
       end
       system("clear")
       puts "Poor #{deleted_pokemon}... I mean, you must've had your own reasons..."
       puts "AKA--you successfully set #{deleted_pokemon} free you evil son of a Rocket!"
       sleep(1)
     elsif user_input == "N"
       show_menu(user)
     else
       puts "Uhh, #{user}--I think you got a typo.."
       db_remove_pokemon(user, pokemon)
     end
   end

   def delete_pokemon(user, users_team)
     # what happens if they say yes
     puts users_team
     raw_team = get_own_team(user, "team")
     user_input = gets.chomp.to_i

     if user_input > 0 && user_input <= 6
       pokemon = raw_team[(user_input-1)]
       db_remove_pokemon(user, pokemon)
     else
       puts "Getting nervous? Second guesses? Cause, you've got a typo or something. #{user}, try again with the list number!"
       sleep(0.5)
     end
   end

  def run
    greeting
    show_menu(get_username)
  end

end
