# GradeBook
# Raphael Adams

require 'minitest/autorun'

class GradeBook

  attr_reader :grades

  def initialize
    @grades = Hash.new(0)
  end

  def add_grade(student, grade)
    @grades[student.to_sym] = grade.to_f
  end

  def get_grade(student)
    @grades[student.to_sym]
  end

  def letter_grades
    @grades.transform_values { |number| number.to_grade }
  end

  def letter_grade(student)
    grade(student).to_grade
  end

end

class Float

  def to_grade
    number = self.to_f
    if number < 50
      'F'
    elsif number < 60
      'D'
    elsif number < 70
      'C'
    elsif number < 80
      'B'
    else
      'A'
    end
  end
end

class GradeBookTest < Minitest::Test
  def setup
    @grade_book = GradeBook.new
    @grade_book.add_grade("christine", 77)
  end
  
  def test_add_student_and_grade
    actual = @grade_book.grades
    expected = { :christine=>77.0 }
    assert_equal(expected, actual)
  end

  def test_letter_grades
    actual = @grade_book.letter_grades
    expected = { :christine=>"B" }
    assert_equal(expected, actual)
  end

  def test_to_grade
    actual = 78.5.to_grade
    expected = "B"
    assert_equal(expected, actual)
  end
  
  def test_add_non_string_student
    @grade_book.add_grade(29, 80) 
    # error, can't call to_sym on a non-string
  end

  def test_add_non_number_grade
    @grade_book.add_grade("steven", "seventy-three")
    actual = @grade_book.get_grade("steven")
    expected = 0
    assert_equal(expected, actual)
  end

  def test_get_grade_nonexistent_student
    actual = @grade_book.get_grade("michael")
    expected = 0
    assert_equal(expected, actual)
  end

  def test_letter_grade
    @grade_book.letter_grade("christine") 
    # error, grade(student) was never defined as a method
  end
end