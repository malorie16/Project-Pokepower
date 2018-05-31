class CommandLineInterface

  def test
    puts "hay"
  end

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

  def gauge_visitor(user_input)
    returning_trainer = Trainer.find_by(name: user_input.capitalize)
    # if returning_trainer == true
    #   puts "Welcome back, #{returning_trainer}!"
    # else
    #   puts "You're not in the database!"
    # end
    # elsif result == "No"
    # gauge_visitor?
    # end
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
    #prof oak welcome message
  end

  def run
    test
    greeting
    get_username
  end

end
