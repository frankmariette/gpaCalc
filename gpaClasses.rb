class Course
	attr_accessor :name, :creditHours, :grade, :courses
  
  def initialize(name)
      @name = name
      $courses.push(@name.capitalize)
	  add
  end

  def add   
      puts("What grade did you receive?")
      @grade = gets.chomp
      $courses.push(@grade.upcase!)
      
      puts("How many credit hours was the course?")
      @creditHours = gets.chomp
      $courses.push(@creditHours)
  end


  def delete

  end
end