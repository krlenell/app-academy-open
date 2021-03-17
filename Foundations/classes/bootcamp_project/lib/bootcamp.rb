class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |hash, k| hash[k] = [] }
  end

  attr_reader :name, :slogan, :teachers, :students

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.length < @student_capacity
      @students << student
      true
    else
      false
    end
  end

  def enrolled?(query)
    @students.any? { |student| student == query }
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(student, grade)
    if enrolled?(student)
      @grades[student] << grade
      true
    else
      false
    end
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    if !enrolled?(student)
      nil
    elsif @grades[student].length == 0
      nil
    else
      @grades[student].sum / @grades[student].length
    end
  end
end
