class CommandLineInterface

  def greeting
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
    puts "Yes or No"
    user_input = gets.chomp
  end

  def create_new_user(user_input)
    system("clear")
    puts "Welcome #{user_input.capitalize}! Where are you from?"
    user_location = gets.chomp
    new_trainer = Trainer.create(name: user_input.capitalize, hometown: user_location.capitalize)
    system("clear")
    puts "That's dope. How's the weather in #{user_location.capitalize}? Are you ready to start your adventure?"
  end

  def gauge_visitor(user_input)
    sleep(1)
    if returning_trainer = Trainer.find_by(name: user_input.capitalize)
      system("clear")
      system "say 'Welcome back, #{returning_trainer.name}!'"
      returning_trainer
    else
      user = create_new_user(user_input)
      user
    end
  end

  def get_username
    puts "What's your nickname?"
    user_input = gets.chomp
    result = verify_username(user_input).capitalize
    if result == "Yes"
      puts "What a lovely name!"
      sleep(0.2)
      puts "Menu loading..."
      gauge_visitor(user_input)
    elsif result == "No"
      get_username
    end
  end

  def show_menu(user)
    puts "Pick a number to get started! 👻 "
    puts "1. View Team"
    puts "2. Add Pokemon to team"
    puts "3. Set pokemon free" #needs confirmation
    puts "4. View Pokestats" #submenu
    puts "5. Exit"
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
      # when 5
      #   log_off
      else
        puts "Whaddya doing? Try again"
        show_menu(user)
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

  def view_team(user, stats)
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
      show_menu(trainer)
    elsif user_input.upcase == "N"
      show_menu(trainer)
    end
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
     puts "Do you wanna set them free? Do you really? (Y or N)"
     user_input = gets.chomp
     if user_input.upcase == "Y"
       users_team = view_team(user, "no")
       puts "Which Pokemon do you wanna remove, playa?"
       # system("clear")
       user_yes(user, users_team)
     elsif user_input.upcase == "N"
       user_no
       show_menu(user)
     end
   end

   def user_yes(user, users_team)
     # what happens if they say yes
     puts users_team
     raw_team = get_own_team(user, "team")
     # user_input 1 -> get_own_team 0
     # pokemon
     # poke_length = pokemon.length
     # pokemon[3..poke_length]
     user_input = gets.chomp.to_i
     if user_input == 1
       puts "You DEADASS tryna delete #{raw_team[0].name}????"
       system("say 'You DEADASS tryna delete #{raw_team[0].name}????'")
       
     elsif user_input == 2
     elsif user_input == 3
     elsif user_input == 4
     elsif user_input == 5
     elsif user_input == 6
     end
   end

   def user_no
     # what happens if they say no
     puts "Woo! That was a close one. The Pokemon are safe.. for now."
     puts "Back to the menu we go!"
   end






















  def run
    greeting
    show_menu(get_username)
  end

end
