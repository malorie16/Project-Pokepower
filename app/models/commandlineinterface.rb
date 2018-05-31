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
    puts "And now the fun begins! 👻 Pick a number to get started!"
  end

  def show_menu(user)
    welcome
    puts "1. View Team"
    puts "2. Add Pokemon to team"
    puts "3. Set pokemon free" #needs confirmation
    puts "4. View Pokestats" #submenu
    puts "5. Exit"
    user_input = gets.chomp.to_i
    if user_input == 1
      view_team(user)
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
    puts "Would you like to see any of these guys' stats? (Y or N)"
    #method for stats
    user_input = gets.chomp
    if user_input.upcase == "Y"
      view_pokemon_stats
    else
      show_menu(user)
    end
  end

  def view_pokemon_stats #for specific user's pokemon
    
  end

  def view_stats #for submenu
    # need to create an exit option
  end


  def run
    greeting
    get_username
  end

end
