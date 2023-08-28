require_relative './classroom'
require_relative './book'
require_relative './person'
require_relative './student'
require_relative './teacher'

class App 
        def self.list_books 
            Book.all.map { |book| puts "Title: #{book.title}, Author: #{booka.author} "}
        end

        def self.list_persons
            Person.all.map { |person| puts "ID: #{person.id} , Name: #{person.name}, Age: #{person.age}"}
        end

        def self.create_classroom(label)
            Classroom.new(label)
        end

        def self.create_person
            print " Do you want to create a student (1) or a teacher (2) ? [input the number] :"
            person_type = gets.chomp.to_i
            case person_type
            when 1 
            create_student

            when 2
            create_teacher

            else 
            puts "Invalid choice. Please enter a valid option."
            execute(3)
            end
            puts "Person created successfully"
        end

        def create_student
            print "Age: "
            student_age = gets.chomp.to_i
            print "Name: "
            student_name = gets.chomp.to_s
            print "Has parent permission ? [Y/N]: "
            parent_permission = gets.chomp
            Student.new(student_age, student_name, parent_permission: true) if %w[Y y].include?(parent_permission)
            Student.new(student_age, student_name, parent_permission: false) if %w[N n].include?(parent_permission)
        end

        def create_teacher
            print "Age: "
            teacher_age = gets.chomp.to_i
            print "Name: "
            teacher_name = gets.chomp.to_s
            print "Specialization: "
            specialization = gets.chomp.to_s
            Teacher.new(teacher_age, teacher_name, specialization)
        end

        def self.create_book
            print "Title: "
            title = gets.chomp.to_s
            print "Author: "
            author = gets.chomp.to_s
            Book.new(title, author)
            puts "Book created successfully"
        end

        def self.create_rental
            puts "Select a book from the following list by number"
            Book.all.map.with_index { |book, index| puts " (#{index + 1}) Title: #{book.title}, Author: #{book.author}" }
            rental_book_index = gets.chomp.to_i
            rental_book = Book.all[rental_book_index-1]

            puts "Select a person from the folowing list by number(not id)"
            Person.all.map.with_index { |person, index| puts "(#{index + 1 }), Name: #{person.name}, Age: #{person.age}"}
            rental_person_index = gets.chomp.to_i
            rental_person = Book.all[rental_person_index - 1]

            print "Date: "
            date = gets.chomp
            Rental.new(date,rental_person, rental_book )
            puts "Rental created successfully"
        end

        def self.list_rentals
            
        end

end

app = App.new
app.main