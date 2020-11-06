# Lego Tests
# Raphael Adams

require 'minitest/autorun'
require_relative '../lego'


class LegoItemTest < Minitest::Test
  def setup
    @lego_item = LegoItem.new("coffee", 11)
  end

  def test_to_s
    assert_equal @lego_item.to_s, "a 11 gram coffee"
  end

  def test_is_heavy
    refute @lego_item.is_heavy(11)
    assert @lego_item.is_heavy(9)
  end
end