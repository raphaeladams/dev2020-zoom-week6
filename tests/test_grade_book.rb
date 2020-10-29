# GradeBook tests
# Raphael Adams

require 'minitest/autorun'
require_relative '../grade_book'

class GradeBookTest < Minitest::Test

  def setup
    @grade_book = GradeBook.new
    @grade_book.add_grade("christine", 77)
  end
    
  def test_add_grade
    actual = @grade_book.grades
    expected = { :christine=>77.0 }
    assert_equal expected, actual
  end

  def test_get_grade
    actual = @grade_book.get_grade("christine")
    expected = 77.0
    assert_equal expected, actual
  end
  
  def test_letter_grades
    actual = @grade_book.letter_grades
    expected = { :christine=>"B" }
    assert_equal expected, actual
  end

  def test_letter_grade
    assert_raises(NoMethodError) { @grade_book.letter_grade("christine") }
  end
  
  def test_to_grade
    actual = 78.5.to_grade
    expected = "B"
    assert_equal expected, actual
  end
  
end