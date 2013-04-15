
def menu
  class_sym = :Course # Allows use of eval method for creating new courses
  options = {one: "1. Add Course", two: "2. Delete Course", three: "3. Calclate GPA", 
  	           four: "4. Display Courses", five: "5. Exit"}
  puts ("What would you like to do? (Type in your option)") 
  options.each{|key, value| puts value}
  puts

  response = gets.chomp

  case response.to_i
    when 1 # Add Course
        puts "What course would you like to add?"
        name = gets.chomp
    	eval "#{name} = #{class_sym}.new(name)"
    when 2 # Delete Course
    	Course.delete
    when 3 # Calculate GPA
    	gpaCalculate
	when 4 # Display Courses
		display
	when 5 # Exit
    	$run = false
	else 
		puts("Not a Valid choice\n")
    end
end

def gpaCalculate #not functional. 
  gradeConv = {'A' => 4, 'B' => 3, 'C' => 2, 'D' => 1, 'F' => 0}
  
  

  gpa = gradePoints / creditHours 
end

def display

  lineWidth = 40
  puts  " Name  Grade  Credits"
  puts  "-----------------------"
  puts

  $courses.each do |name, grade, creditHours|
      puts name.ljust(lineWidth/2) + grade.to_s.center(10) + creditHours.to_s.rjust(lineWidth/2) + "\n"
  end
    
end

