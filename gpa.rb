require_relative 'gpaClasses.rb'


student = Student.new("Frank")
# Starts the program
run = true
while run
  options = {one: "1. Add Course", two: "2. Delete Course", three: "3. Calclate GPA", 
               four: "4. Display Courses", five: "5. Exit"}
  puts ("What would you like to do?") 
  options.each{|key, value| puts value}
  response = gets.chomp
  puts

  case response.to_i
    when 1 # Add Course
      student.add_class(Course.new)
    when 2 # Delete Course
     student.delete_class
    when 3 # Calculate GPA
      puts student.calculate_gpa
    when 4 # Display Courses
     schedule = student.display
    when 5 # Exit
      run = false
    else 
      puts("Not a Valid choice\n")
    end
end

