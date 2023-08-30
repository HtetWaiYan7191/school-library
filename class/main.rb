require_relative 'app'
require_relative 'execute'
# rubocop:disable Metrics
class Main
  def display_ui
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    user_choice = gets.chomp.to_i
    puts user_choice
    Execute.new(user_choice).execute
  end
end
# rubocop:enable Metrics

puts 'Welcome to School Library App!'
Main.new.display_ui
