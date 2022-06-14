require_relative '../config/environment'

# create CLI & greet user
cli = CLI.new
cli.greet

# display options & wait for input
puts ""
puts "------------------------------------"
puts "Please choose an option to continue:"
puts "1: Login"
puts "2: Quit"
puts "------------------------------------"
puts ""

# store user's decision
user_choice = nil

while true
    user_input = gets.chomp
    puts "Your input: '#{user_input}'."

    if user_input == "1"
        user_choice = 1
        break
    elsif user_input == "2"
        user_choice = 2
        break
    else 
        puts "Invalid input; please try again by typing 1 or 2."
    end
end

user_choice == 1 ? cli.login : cli.quit

#binding.pry
