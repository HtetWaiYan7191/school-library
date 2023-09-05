require_relative 'app'
require_relative 'execute'
require 'json'

class Main
  def display_ui
    puts 'Please choose an option by entering a number:'
    load_data # Moved this line here
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Save data And Exit'
    user_choice = gets.chomp.to_i
    puts user_choice
    Execute.new(user_choice).execute
  end

  # rubocop:disable Metrics/MethodLength
  def load_data
    books = JSON.parse(File.read('books.json')) 
    people = JSON.parse(File.read('people.json'))
    rentals = JSON.parse(File.read('rentals.json'))

    puts 'Books:'
    books.each do |book|
      puts "Title: #{book['title']} Author: #{book['author']}"
    end

    puts 'People:'
    people.each do |person|
      puts "ID: #{person['id']} Age: #{person['age']} Name: #{person['name']} Rental: #{person['rental']}"
    end

    puts 'Rentals:'
    rentals.each do |rental|
      date = rental['date']
      person = rental['person']
      book = rental['book']

      puts "Date: #{date}"
      puts "Person ID: #{person['id']}"
      puts "Person Age: #{person['age']}"
      puts "Person Name: #{person['name']}"
      puts "Book Author: #{book['author']}"
      puts "Book Title: #{book['title']}"
      puts '----------'
    end
  end

  # rubocop:enable Metrics/MethodLength
end

puts 'Welcome to School Library App!'
Main.new.display_ui
