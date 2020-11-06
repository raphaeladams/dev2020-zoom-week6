# Lego Tests
# Raphael Adams

require 'minitest/autorun'
require_relative '../lego'


class LegoHatTest < Minitest::Test
  def setup
    @lego_hat = LegoHat.new(4, "red", "baseball cap")
  end

  def test_to_s
    assert_equal @lego_hat.to_s, "a 4 red baseball cap"
  end
end