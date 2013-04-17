class Student
  attr_accessor :name, :courses, :gpa

  def initialize name
    @name = name
    @courses = []
    @gpa = 0.0
  end

  def add_class course
    @courses << course
  end

  def delete_class
    puts "What course would you like to delete?"
    name = gets.chomp
    name = name.capitalize

    @courses.each do |course|
      if course.name == name
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
      points = points + course.gradePoints
      hours  = hours  + course.creditHours
    end

    gpa = points / hours

    @gpa = gpa

    puts "Your GPA is: #{gpa}"


  end

end



class Course
	attr_reader :name, :creditHours, :gradePoints
  
  def initialize name, grade, creditHours
      @name = name
      @grade = grade
      @creditHours = creditHours
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