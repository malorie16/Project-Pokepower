class CommandLineInterface

  def greeting
    puts "---Module 1 Group Project---"
    puts "--The Pokemon Project--"
    puts "-Aisatou-Malorie-Paul-"
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
    if returning_trainer = Trainer.find_by(name: user_input.capitalize)
      system("clear")
      system "say 'Welcome back, #{returning_trainer.name}!'"
      show_menu(returning_trainer)
    else
      user = create_new_user(user_input)
      show_menu(user)
    end
  end

  def get_username
    puts "What's your nickname?"
    user_input = gets.chomp
    result = verify_username(user_input).capitalize
    if result == "Yes"
      puts "What a lovely name!"
      gauge_visitor(user_input)
    elsif result == "No"
      get_username
    end
  end

  def welcome
    puts "Pick a number to get started! 👻 "
  end

  def show_menu(user)
    welcome
    puts "1. View Team"
    puts "2. Add Pokemon to team"
    puts "3. Set pokemon free" #needs confirmation
    puts "4. View Pokestats" #submenu
    puts "5. Exit"
    user_input = gets.chomp.to_i
    case user_input
    when 1
      view_team(user)
    # when 2
    #   add_pokemon_to_team
    # when 3
    #   set_pokemon_free
    when 4
      view_stats(user)
    # when 5
    #   log_off
    end
  end

  def view_team(user)
    team = user.pokemons.map do |pokemon|
      pokemon.name
    end
    system("clear")
    counter = 0
     team.each do |poke|
       puts "#{counter += 1}. #{poke}"
     end
     view_team_stats(user)
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
    puts "Would you like to these guys' stats? (Y or N)"
    user_input = gets.chomp
    if user_input.upcase == "Y"
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
    puts stats_table(found_pokemon)
    show_menu(trainer)
  end














  def add_pokemon_to_team
    #adds pokemon to team
    #player can only have 6 teams
    #malorie
  end












  def set_pokemon_free
    #takes pokemon off team
    #aisatou
  end













  def log_off
    #exits program
  end














  def run
    greeting
    get_username
  end

end
