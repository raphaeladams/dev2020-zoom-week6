# GradeBook tests
# Raphael Adams

require 'minitest/autorun'
require_relative '../grade_book'

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
    assert_raises(NoMethodError) { @grade_book.add_grade(29, 80) }
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
    assert_raises(NoMethodError) { @grade_book.letter_grade("christine") }
  end
end