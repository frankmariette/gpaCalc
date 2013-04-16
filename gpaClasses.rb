class Student
  attr_accessor :courses

  def initialize name
    @name = name
    @courses = []
  end

  def add_class course
    @courses << course
  end

  def delete_class
    puts "What course would you like to delete?"
    name = gets.chomp
    name = name.capitalize

    @courses.each do |course|
      if course.instance_variable_get(:@name) == name
        @courses.delete(course)
        puts "#{name} has been deleted!"
      else
        puts "This courses does not exist"
      end
    end
  end


  def display
    @courses.each do |course|
      p course
    end
  end

  def calculate_gpa 
    points, hours = 0, 0
    @courses.each do |course|
      points = points + course.instance_variable_get(:@gradePoints)
      hours  = hours  + course.instance_variable_get(:@creditHours)
    end

    gpa = points / hours

    puts "Your GPA is: #{gpa}"


  end

end



class Course
	attr_accessor :creditHours, :grade, :gradePoints
  
  def initialize
      puts "What is the name of the course?"
      @name = gets.chomp
      @name = @name.capitalize
      puts("What grade did you receive?")
      @grade = gets.chomp
      @grade = @grade.upcase
      puts("How many credit hours was the course?")
      @creditHours = gets.chomp
      @creditHours = @creditHours.to_i

      grade_conversion
  end

  def grade_conversion
    case @grade.upcase
    when 'A'
      @gradePoints = 4.0 * @creditHours
    when 'B'
      @gradePoints = 3.0 * @creditHours
    when 'C'
      @gradePoints = 2.0 * @creditHours
    when 'D'
      @gradePoints = 1.0 * @creditHours
    else
      @gradePoints = 0.0
    end
  end
end