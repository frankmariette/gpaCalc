require_relative 'gpaClasses.rb'
require 'yaml'

folder_check = File.directory?('./users')

if folder_check
  Dir.chdir './users'
else
  Dir.mkdir 'users'
  Dir.chdir './users'
end


login = true

while login
  login_menu = {one: "1. New Student", two: "2. Existing Student", three: "3. Exit"}

  login_menu.each {|key,value| puts value}
  login_response = gets.chomp
  puts

  case login_response.to_i
    when 1 #New Student
      puts "What is your name?"
      name = gets.chomp
      student = Student.new(name)
      break
    when 2 #Existing student
      puts "What is your name?"
      filename = gets.chomp
      student = YAML::load( File.open( "#{filename.downcase}.txt" ) )
      break
    when 3 #Exit
      exit
    else
      puts "Not a valid response."
  end
end

# Starts the program
run = true
while run
  options = {one: "1. Add Course", two: "2. Delete Course", three: "3. Display GPA", 
               four: "4. Display Courses", five: "5. Exit"}
  puts ("What would you like to do?") 
  options.each{|key, value| puts value}
  response = gets.chomp
  puts

  case response.to_i
    when 1 # Add Course
      puts "What is the name of the course?"
      name = gets.chomp
      name = name.split(' ').map { |w| w.capitalize  }.join(' ')

      puts("What grade did you receive?")
      grade = gets.chomp
      grade = grade.capitalize

      puts("How many credit hours was the course?")
      creditHours = gets.chomp
      creditHours =creditHours.to_i

      student.add_class(Course.new(name, grade, creditHours))
    when 2 # Delete Course
     student.delete_class
    when 3 # Calculate GPA
      puts student.calculate_gpa
    when 4 # Display Courses
     schedule = student.display
    when 5 # Exit
      File.open "#{student.name.downcase}.txt", 'w' do |f|
          f.write student.to_yaml
      end
      exit
    else 
      puts("Not a Valid choice\n")
    end
end

