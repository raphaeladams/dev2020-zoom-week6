# ASCII Art TDD
# Raphael Adams

require 'minitest/autorun'
require_relative '../ascii_art'


class AsciiArtTest < Minitest::Test
  def setup
    @ascii_art_1 = AsciiArt.draw(1)
    @ascii_art_2 = AsciiArt.draw(2)
    @ascii_art_3 = AsciiArt.draw(3)
    @ascii_art_5 = AsciiArt.draw(5)
    @ascii_art_0 = AsciiArt.draw(0)
  end

  def test_left_triangle
    # assert_output("*\n") { print @ascii_art_1 }
    # assert_output("*\n**\n") { print @ascii_art_2 }
    # assert_output("*\n**\n***\n") { print @ascii_art_3 }
    # assert_output("*\n**\n***\n****\n*****\n") { print @ascii_art_5 }
    # assert_output("") { print @ascii_art_0 }
  end

  def test_right_triangle
    # assert_output("*\n") { print @ascii_art_1 }
    # assert_output(" *\n**\n") { print @ascii_art_2 }
    # assert_output("  *\n **\n***\n") { print @ascii_art_3 }
    # assert_output("    *\n   **\n  ***\n ****\n*****\n") { print @ascii_art_5 }
    # assert_output("") { print @ascii_art_0 }
  end

  def test_center_triangle
    # assert_output("* \n") { print @ascii_art_1 }
    # assert_output(" * \n* * \n") { print @ascii_art_2 }
    # assert_output("  * \n * * \n* * * \n") { print @ascii_art_3 }
    # assert_output("    * \n   * * \n  * * * \n * * * * \n* * * * * \n") { print @ascii_art_5 }
    # assert_output("") { print @ascii_art_0 }
  end

  def test_diamond
    assert_output("* \n") { print @ascii_art_1 }
    assert_output(" * \n* * \n * \n") { print @ascii_art_2 }
    assert_output("  * \n * * \n* * * \n * * \n  * \n") { print @ascii_art_3 }
    assert_output("    * \n   * * \n  * * * \n * * * * \n* * * * * \n * * * * \n  * * * \n   * * \n    * \n") { print @ascii_art_5 }
    assert_output("") { print @ascii_art_0 }
  end
end